import 'dart:async';

import 'package:listanything/standard/authenticationClient/models/authentication_user.dart';

/// {@template authentication_exception}
/// Exceptions from the authentication client.
/// {@endtemplate}
abstract class AuthenticationException implements Exception {
  /// {@macro authentication_exception}
  const AuthenticationException(this.error);

  /// The error which was caught.
  final Object error;
}

/// {@template send_login_email_and_password_failure}
/// Thrown during the sending login email link process if a failure occurs.
/// {@endtemplate}
class SendLoginEmailAndPasswordFailure extends AuthenticationException {
  /// {@macro send_login_email_and_password_failure}
  const SendLoginEmailAndPasswordFailure(super.error);
}

/// {@template is_log_in_email_and_password_failure}
/// Thrown during the validation of the email link process if a failure occurs.
/// {@endtemplate}
class IsLogInWithEmailAndPasswordFailure extends AuthenticationException {
  /// {@macro is_log_in_email_and_password_failure}
  const IsLogInWithEmailAndPasswordFailure(super.error);
}

/// {@template log_in_with_email_and_password_failure}
/// Thrown during the sign in with email link process if a failure occurs.
/// {@endtemplate}
class LogInWithEmailAndPasswordFailure extends AuthenticationException {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure(super.error);
}

/// {@template log_in_with_apple_failure}
/// Thrown during the sign in with apple process if a failure occurs.
/// {@endtemplate}
class LogInWithAppleFailure extends AuthenticationException {
  /// {@macro log_in_with_apple_failure}
  const LogInWithAppleFailure(super.error);
}

/// {@template log_in_with_google_failure}
/// Thrown during the sign in with google process if a failure occurs.
/// {@endtemplate}
class LogInWithGoogleFailure extends AuthenticationException {
  /// {@macro log_in_with_google_failure}
  const LogInWithGoogleFailure(super.error);
}

/// {@template log_in_with_google_canceled}
/// Thrown during the sign in with google process if it's canceled.
/// {@endtemplate}
class LogInWithGoogleCanceled extends AuthenticationException {
  /// {@macro log_in_with_google_canceled}
  const LogInWithGoogleCanceled(super.error);
}

/// {@template log_in_with_facebook_failure}
/// Thrown during the sign in with Facebook process if a failure occurs.
/// {@endtemplate}
class LogInWithFacebookFailure extends AuthenticationException {
  /// {@macro log_in_with_facebook_failure}
  const LogInWithFacebookFailure(super.error);
}

/// {@template log_in_with_facebook_canceled}
/// Thrown during the sign in with Facebook process if it's canceled.
/// {@endtemplate}
class LogInWithFacebookCanceled extends AuthenticationException {
  /// {@macro log_in_with_facebook_canceled}
  const LogInWithFacebookCanceled(super.error);
}

/// {@template log_in_with_twitter_failure}
/// Thrown during the sign in with Twitter process if a failure occurs.
/// {@endtemplate}
class LogInWithTwitterFailure extends AuthenticationException {
  /// {@macro log_in_with_twitter_failure}
  const LogInWithTwitterFailure(super.error);
}

/// {@template log_in_with_twitter_canceled}
/// Thrown during the sign in with Twitter process if it's canceled.
/// {@endtemplate}
class LogInWithTwitterCanceled extends AuthenticationException {
  /// {@macro log_in_with_twitter_canceled}
  const LogInWithTwitterCanceled(super.error);
}

/// {@template log_out_failure}
/// Thrown during the logout process if a failure occurs.
/// {@endtemplate}
class LogOutFailure extends AuthenticationException {
  /// {@macro log_out_failure}
  const LogOutFailure(super.error);
}

/// A generic Authentication Client Interface.
abstract class AuthenticationClient {
  /// Stream of [AuthenticationUser] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [AuthenticationUser.anonymous] if the user is not authenticated.
  Stream<AuthenticationUser> get user;

  /// Starts the Sign In with Email Flow.
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithEmailAndPassword(String email, String password);

  /// Starts the Sign In with Apple Flow.
  ///
  /// Throws a [LogInWithAppleFailure] if an exception occurs.
  Future<void> logInWithApple();

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  Future<void> logInWithGoogle();

  /// Starts the Sign In with Facebook Flow.
  ///
  /// Throws a [LogInWithFacebookFailure] if an exception occurs.
  Future<void> logInWithFacebook();

  /// Starts the Sign In with Twitter Flow.
  ///
  /// Throws a [LogInWithTwitterFailure] if an exception occurs.
  Future<void> logInWithTwitter();

  /// Signs out the current user which will emit
  /// [AuthenticationUser.anonymous] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut();
}
