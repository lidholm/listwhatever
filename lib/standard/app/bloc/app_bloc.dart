import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/userRepository/user_service.dart';
import '/standard/app/bloc/app_event.dart';
import '/standard/app/bloc/app_state.dart';
import '/standard/userRepository/models/user.dart';
import '/standard/userRepository/user_repository.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required UserRepository userRepository,
    required User user,
    required UserService userService,
  })  : _userRepository = userRepository,
        _userService = userService,
        super(
          user.isAnonymous() ? const AppState.unauthenticated() : AppState.authenticated(user),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<UpdateSettings>(_onUpdateSettings);
    on<AppOnboardingCompleted>(_onOnboardingCompleted);
    on<AppLogoutRequested>(_onLogoutRequested);
    on<AppOpened>(_onAppOpened);

    _userSubscription = _userRepository.user.listen(_userChanged);
  }

  /// The number of app opens after which the login overlay is shown
  /// for an unauthenticated user.
  static const _appOpenedCountForLoginOverlay = 5;

  final UserRepository _userRepository;
  final UserService _userService;

  late StreamSubscription<User> _userSubscription;

  void _userChanged(User user) => add(AppUserChanged(user));

  Future<void> _onUserChanged(AppUserChanged event, Emitter<AppState> emit) async {
    final user = event.user;

    switch (state.status) {
      case AppStatus.onboardingRequired:
      case AppStatus.authenticated:
      case AppStatus.unauthenticated:
        // TODO: Handle all of this correctly
        if (!user.hasLoadedFromFirestore) {
          final firestoreUser = await _userService.getUser();
          logger.i('$this => loaded firestoreUser: $firestoreUser');

          final mergedUser = (firestoreUser == null)
              ? user.copyWith(hasLoadedFromFirestore: true)
              : user.copyWith(hasLoadedFromFirestore: true, settings: firestoreUser.settings);
          emit(AppState.authenticated(mergedUser));
        } else if (user.isAnonymous() && user.isNewUser) {
          return emit(AppState.onboardingRequired(user));
        } else {
          user.isAnonymous() ? emit(const AppState.unauthenticated()) : emit(AppState.authenticated(user));
        }
    }
  }

  void _onOnboardingCompleted(
    AppOnboardingCompleted event,
    Emitter<AppState> emit,
  ) {
    if (state.status == AppStatus.onboardingRequired) {
      return state.user.isAnonymous()
          ? emit(const AppState.unauthenticated())
          : emit(AppState.authenticated(state.user));
    }
  }

  Future<void> _onUpdateSettings(UpdateSettings event, Emitter<AppState> emit) async {
    // TODO: This should maybe not be allowed?
    if (!state.user.isAnonymous()) {
      final updatedUser = event.user.copyWith(settings: event.settings);
      await _userService.updateUser(updatedUser);
      emit(AppState.authenticated(updatedUser));
    }
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    // We are disabling notifications when a user logs out because
    // the user should not receive any notifications when logged out.

    unawaited(_userRepository.logOut());
  }

  Future<void> _onAppOpened(AppOpened event, Emitter<AppState> emit) async {
    if (state.user.isAnonymous()) {
      final appOpenedCount = await _userRepository.fetchAppOpenedCount();

      if (appOpenedCount == _appOpenedCountForLoginOverlay - 1) {
        emit(state.copyWith(showLoginOverlay: true));
      }

      if (appOpenedCount < _appOpenedCountForLoginOverlay + 1) {
        await _userRepository.incrementAppOpenedCount();
      }
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
