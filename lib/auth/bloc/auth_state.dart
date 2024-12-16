part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoggedInWithData extends AuthState {
  AuthLoggedInWithData(this.user);
  final User user;
}

final class AuthOnboardingRequired extends AuthState {
  AuthOnboardingRequired(this.user);
  final AuthenticationUser user;
}

final class AuthLoggedIn extends AuthState {
  AuthLoggedIn(this.user);
  final AuthenticationUser user;
}

final class AuthLoggedOut extends AuthState {}
