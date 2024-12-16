import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:listwhatever/auth/auth_repository.dart';
import 'package:listwhatever/auth/models/authentication_user.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AuthenticationUserChanged>(_onUserChanged);
    on<LoginWithApple>(_onLoginWithApple);
    on<LoginWithGoogle>(_onLoginWithGoogle);
    on<LoginWithEmailAndPassword>(_onLoginWithEmailAndPassword);
    on<SignUpWithApple>(_onSignUpWithApple);
    on<SignUpWithGoogle>(_onSignUpWithGoogle);
    on<Logout>(_onLogout);

    _authSubscription = authRepository.user.listen(_userChanged);
  }

  final AuthRepository authRepository;

  late StreamSubscription<AuthenticationUser> _authSubscription;

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }

  void _userChanged(AuthenticationUser user) {
    add(AuthenticationUserChanged(user: user));
  }

  Future<void> _onUserChanged(
    AuthenticationUserChanged event,
    Emitter<AuthState> emit,
  ) async {
    final user = event.user;

    if (user.isAnonymous()) {
      emit(AuthLoggedOut());
      return;
    }

    emit(AuthLoggedIn(user));
    final userWithData = await tryReadUser(user);
    //

    if (userWithData == null) {
      emit(AuthOnboardingRequired(user));
      return;
    } else {
      emit(AuthLoggedInWithData(userWithData));
      return;
    }
  }

  void _onLoginWithApple(LoginWithApple event, Emitter<AuthState> emit) {
    print('LoginWithApple');
  }

  void _onLoginWithGoogle(LoginWithGoogle event, Emitter<AuthState> emit) {
    print('LoginWithGoogle');
  }

  Future<void> _onLoginWithEmailAndPassword(
    LoginWithEmailAndPassword event,
    Emitter<AuthState> emit,
  ) async {
    print('LoginWithEmailAndPassword ${event.email} ${event.password}');
    await authRepository.logInWithEmailAndPassword(event.email, event.password);
  }

  void _onSignUpWithApple(SignUpWithApple event, Emitter<AuthState> emit) {
    print('SignUpWithApple');
  }

  void _onSignUpWithGoogle(SignUpWithGoogle event, Emitter<AuthState> emit) {
    print('SignUpWithGoogle');
  }

  void _onLogout(Logout event, Emitter<AuthState> emit) {
    authRepository.logOut();
  }

  Future<User?> tryReadUser(AuthenticationUser user) async {
    try {
      return null;
      // final firestoreUser = await _userService.getUser(user.id);
      // if (firestoreUser == null) {
      //   return null;
      // }

      // final fullUser = user.copyWith(settings: firestoreUser.settings);
      // //
      // return fullUser;
    } catch (e) {
      return null;
    }
  }
}
