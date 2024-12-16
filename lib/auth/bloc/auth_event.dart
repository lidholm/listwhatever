part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthenticationUserChanged extends AuthEvent {
  AuthenticationUserChanged({required this.user});
  final AuthenticationUser user;
}

class SignUpWithApple extends AuthEvent {}

class SignUpWithGoogle extends AuthEvent {}

class RegisterWithEmailAndPassword extends AuthEvent {}

class LoginWithApple extends AuthEvent {}

class LoginWithGoogle extends AuthEvent {}

class LoginWithEmailAndPassword extends AuthEvent {
  LoginWithEmailAndPassword({required this.email, required this.password});
  final String email;
  final String password;
}
