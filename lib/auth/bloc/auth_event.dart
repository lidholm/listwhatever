part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignUpWithApple extends AuthEvent {}

class SignUpWithGoogle extends AuthEvent {}

class LoginWithApple extends AuthEvent {}

class LoginWithGoogle extends AuthEvent {}

class LoginWithEmailAndPassword extends AuthEvent {}
