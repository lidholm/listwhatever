import 'dart:async';

import 'package:bloc/bloc.dart';

import '/standard/app/bloc/app_event.dart';
import '/standard/app/bloc/app_state.dart';
import '/standard/constants.dart';
import '/standard/userRepository/models/user.dart';
import '/standard/userRepository/user_repository.dart';
import '/standard/userRepository/user_service.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required UserRepository userRepository,
    required User user,
    required UserService userService,
  })  : _userRepository = userRepository,
        _userService = userService,
        super(
          user.isAnonymous() ? AppState.loggedOut() : AppState.loggedIn(user),
        ) {
    on<AuthenticationUserChanged>(_onUserChanged);
    // on<UpdateSettings>(_onUpdateSettings);
    on<UpdateUser>(_onUpdateUser);
    on<AddUser>(_onAddUser);
    on<AppLogoutRequested>(_onLogoutRequested);
    // on<AppOpened>(_onAppOpened);

    _userSubscription = _userRepository.user.listen(_userChanged);
  }

  /// The number of app opens after which the login overlay is shown
  /// for an unauthenticated user.
  // static const _appOpenedCountForLoginOverlay = 5;

  final UserRepository _userRepository;
  final UserService _userService;

  late StreamSubscription<User> _userSubscription;

  void _userChanged(User user) {
    logger.i('$this => add(AppUserChanged(${user.id})) QQQ1');
    add(AuthenticationUserChanged(user));
  }

  Future<void> _onUserChanged(AuthenticationUserChanged event, Emitter<AppState> emit) async {
    final user = event.user;

    logger
      ..i('$this => state.status: $state      QQQQQ 21')
      ..i('$this => user: $user      QQQQQ 22');
    if (user.isAnonymous()) {
      emit(AppState.loggedOut());
      return;
    }

    if (user.isAnonymous()) {
      logger.i('$this => AppStatus.loggedOut QQQQQ 23');
      emit(AppState.loggedOut());
    }
    emit(AppState.loggedIn(user));
    final userWithData = await tryReadUser(user);

    if (userWithData == null) {
      emit(AppState.onboardingRequired(user));
    } else {
      emit(AppState.loggedInWithData(userWithData));
    }
  }

  // Future<void> _onUpdateSettings(UpdateSettings event, Emitter<AppState> emit) async {
  //   // TODO: This should maybe not be allowed?
  //   if (!state.user.isAnonymous()) {
  //     final updatedUser = event.user.copyWith(settings: event.settings);
  //     await _userService.updateUser(updatedUser);
  //     emit(AppState.authenticated(updatedUser));
  //   }
  // }

  Future<void> _onUpdateUser(UpdateUser event, Emitter<AppState> emit) async {
    logger.i('$this => _onUpdateUser $event');

    await _userService.updateUser(event.user);
  }

  Future<void> _onAddUser(AddUser event, Emitter<AppState> emit) async {
    logger.i('$this => _onAddUser $event');

    final user = await _userService.addUser(event.user);
    emit(LoggedInWithData(user));
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_userRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  Future<User?> tryReadUser(User user) async {
    logger.i('$this => in tryReadUser QQQQ 31');
    final firestoreUser = await _userService.getUser();
    logger
      ..i('$this => loaded firestoreUser: $firestoreUser')
      ..i('$this => in firestoreUser $firestoreUser QQQQ 31');

    if (firestoreUser == null) {
      logger.i('$this => return null');
      return null;
    }

    final fullUser = user.copyWith(settings: firestoreUser.settings);
    logger.i('$this => return fullUser: $fullUser');
    return fullUser;
  }
}
