import 'dart:async';

import 'package:equatable/equatable.dart';

import '/standard/authenticationClient/authentication_client.dart';
import '/standard/constants.dart';
import '/standard/userRepository/models/user.dart';
import '/standard/userRepository/user_storage.dart';

/// {@template user_failure}
/// A base failure for the user repository failures.
/// {@endtemplate}
abstract class UserFailure with EquatableMixin implements Exception {
  /// {@macro user_failure}
  const UserFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

/// {@template fetch_app_opened_count_failure}
/// Thrown when fetching app opened count fails.
/// {@endtemplate}
class FetchAppOpenedCountFailure extends UserFailure {
  /// {@macro fetch_app_opened_count_failure}
  const FetchAppOpenedCountFailure(super.error);
}

/// {@template increment_app_opened_count_failure}
/// Thrown when incrementing app opened count fails.
/// {@endtemplate}
class IncrementAppOpenedCountFailure extends UserFailure {
  /// {@macro increment_app_opened_count_failure}
  const IncrementAppOpenedCountFailure(super.error);
}

/// {@template fetch_current_subscription_failure}
/// An exception thrown when fetching current subscription fails.
/// {@endtemplate}
class FetchCurrentSubscriptionFailure extends UserFailure {
  /// {@macro fetch_current_subscription_failure}
  const FetchCurrentSubscriptionFailure(super.error);
}

/// {@template user_repository}
/// Repository which manages the user domain.
/// {@endtemplate}
class UserRepository {
  /// {@macro user_repository}
  UserRepository({
    required AuthenticationClient authenticationClient,
    required UserStorage storage,
  })  : _authenticationClient = authenticationClient,
        _storage = storage;

  final AuthenticationClient _authenticationClient;
  final UserStorage _storage;

  /// Stream of [User] which will emit the current user when
  /// the authentication state or the subscription plan changes.
  ///
  Stream<User> get user => _authenticationClient.user.map(
        (authenticationUser) {
          logger.i(
              '$this => authenticationUser.email: ${authenticationUser.email}     QQQ9');
          return fromAuthenticationUser(
            authenticationUser,
          );
        },
      ).asBroadcastStream();

  /// Starts the Sign In with Apple Flow.
  ///
  /// Throws a [LogInWithAppleFailure] if an exception occurs.
  Future<void> logInWithApple() async {
    try {
      await _authenticationClient.logInWithApple();
    } on LogInWithAppleFailure {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(LogInWithAppleFailure(error, null), stackTrace);
    }
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleCanceled] if the flow is canceled by the user.
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  Future<void> logInWithGoogle() async {
    try {
      logger.i('$this logInWithGoogle');
      await _authenticationClient.logInWithGoogle();
      logger.i('$this logInWithGoogle done');
    } on LogInWithGoogleFailure {
      logger.i('logInWithGoogle');
      rethrow;
    } on LogInWithGoogleCanceled {
      logger.i('LogInWithGoogleCanceled');
      rethrow;
    } catch (error, stackTrace) {
      logger.i('error');
      Error.throwWithStackTrace(
          LogInWithGoogleFailure(error, null), stackTrace);
    }
  }

  /// Starts the Sign In with Twitter Flow.
  ///
  /// Throws a [LogInWithTwitterCanceled] if the flow is canceled by the user.
  /// Throws a [LogInWithTwitterFailure] if an exception occurs.
  Future<void> logInWithTwitter() async {
    try {
      await _authenticationClient.logInWithTwitter();
    } on LogInWithTwitterFailure {
      rethrow;
    } on LogInWithTwitterCanceled {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
          LogInWithTwitterFailure(error, null), stackTrace);
    }
  }

  /// Starts the Sign In with Facebook Flow.
  ///
  /// Throws a [LogInWithFacebookCanceled] if the flow is canceled by the user.
  /// Throws a [LogInWithFacebookFailure] if an exception occurs.
  Future<void> logInWithFacebook() async {
    try {
      await _authenticationClient.logInWithFacebook();
    } on LogInWithFacebookFailure {
      rethrow;
    } on LogInWithFacebookCanceled {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
          LogInWithFacebookFailure(error, null), stackTrace);
    }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _authenticationClient.logInWithEmailAndPassword(email, password);
    } on LogInWithEmailAndPasswordFailure {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
          LogInWithEmailAndPasswordFailure(error, null), stackTrace);
    }
  }

  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await _authenticationClient.logOut();
    } on LogOutFailure {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(LogOutFailure(error, null), stackTrace);
    }
  }

  /// Returns the number of times the app was opened.
  Future<int> fetchAppOpenedCount() async {
    try {
      return await _storage.fetchAppOpenedCount();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        FetchAppOpenedCountFailure(error),
        stackTrace,
      );
    }
  }

  /// Increments the number of times the app was opened by 1.
  Future<void> incrementAppOpenedCount() async {
    try {
      final value = await fetchAppOpenedCount();
      final result = value + 1;
      await _storage.setAppOpenedCount(count: result);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        IncrementAppOpenedCountFailure(error),
        stackTrace,
      );
    }
  }
}
