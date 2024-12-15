import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:listwhatever/auth/models/authentication_user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// Signature for [SignInWithApple.getAppleIDCredential].
typedef GetAppleCredentials = Future<AuthorizationCredentialAppleID> Function({
  required List<AppleIDAuthorizationScopes> scopes,
  WebAuthenticationOptions webAuthenticationOptions,
  String nonce,
  String state,
});

/// {@template firebase_authentication_client}
/// {@endtemplate}
class AuthRepository {
  /// {@macro firebase_authentication_client}
  AuthRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    GetAppleCredentials? getAppleCredentials,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _getAppleCredentials =
            getAppleCredentials ?? SignInWithApple.getAppleIDCredential {
    // user.listen(_onUserChanged);
  }
  final String className = 'FirebaseAuthenticationClient';

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final GetAppleCredentials _getAppleCredentials;

  /// Stream of [AuthenticationUser] which will emit the current user when
  /// the authentication state changes.
  Stream<AuthenticationUser> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null
          ? AuthenticationUser.anonymous()
          : firebaseUser.toUser;
    });
  }

  /// Starts the Sign In with Email and Password Flow.
  Future<void> logInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        error,
        // LogInWithEmailAndPasswordFailure(error, null),
        stackTrace,
      );
    }
  }

  /// Starts the Sign In with Apple Flow.
  Future<void> logInWithApple() async {
    try {
      final appleIdCredential = await _getAppleCredentials(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final oAuthProvider = firebase_auth.OAuthProvider('apple.com');
      final credential = oAuthProvider.credential(
        idToken: appleIdCredential.identityToken,
        accessToken: appleIdCredential.authorizationCode,
      );
      await _firebaseAuth.signInWithCredential(credential);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        // LogInWithAppleFailure(error, null),
        error,
        stackTrace,
      );
    }
  }

  /// Starts the Sign In with Google Flow.
  Future<firebase_auth.UserCredential> logInWithGoogle() async {
    if (kIsWeb) {
      return logInWithGoogleWeb();
    } else {
      return logInWithGoogleOther();
    }
  }

  Future<firebase_auth.UserCredential> logInWithGoogleOther() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw
            // LogInWithGoogleCanceled(
            Exception('Sign in with Google canceled');
        // null,
        // );
      }
      final googleAuth = await googleUser.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCreds = await _firebaseAuth.signInWithCredential(credential);

      return userCreds;
      // } on LogInWithGoogleCanceled {
      //   rethrow;
    } catch (error, stackTrace) {
      // final extraMessage = (error is AssertionError)
      //     ? error.message.toString()
      //     : error.runtimeType.toString();
      Error.throwWithStackTrace(
        // LogInWithGoogleFailure(error, extraMessage),
        error,
        stackTrace,
      );
    }
  }

  Future<UserCredential> logInWithGoogleWeb() async {
    try {
      // Create a new provider
      final googleProvider = GoogleAuthProvider()
        ..addScope('https://www.googleapis.com/auth/contacts.readonly')
        ..setCustomParameters({'login_hint': 'user@example.com'});

      // Once signed in, return the UserCredential
      final userCredentials =
          await FirebaseAuth.instance.signInWithPopup(googleProvider);

      return userCredentials;

      // Or use signInWithRedirect
      // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
    } catch (error, stackTrace) {
      // var extraMessage = error.runtimeType.toString();
      // if (error is AssertionError) {
      //   extraMessage = error.message.toString();
      // }
      // if (error is firebase_auth.FirebaseAuthException) {
      //   extraMessage = '${error.code} - ${error.message}';
      // }
      Error.throwWithStackTrace(
        // LogInWithGoogleFailure(error, extraMessage),
        error,
        stackTrace,
      );
    }
  }

  /// Signs out the current user which will emit
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        // LogOutFailure(error, null),
        error,
        stackTrace,
      );
    }
  }

  // Future<void> _onUserChanged(AuthenticationUser user) async {
  //   if (!user.isAnonymous) {
  //     await _tokenStorage.saveToken(user.id);
  //   } else {
  //     await _tokenStorage.clearToken();
  //   }
  // }
}

extension on firebase_auth.User {
  AuthenticationUser get toUser {
    return AuthenticationUser(
      id: uid,
      email: email,
      name: displayName,
      photo: photoURL,
      isNewUser: metadata.creationTime == metadata.lastSignInTime,
    );
  }
}
