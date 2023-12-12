// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:authentication_client/authentication_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:user_repository/user_repository.dart';

class MockAuthenticationClient extends Mock implements AuthenticationClient {}

class MockUserStorage extends Mock implements UserStorage {}

class MockUser extends Mock implements AuthenticationUser {}

class FakeLogInWithAppleFailure extends Fake implements LogInWithAppleFailure {}

class FakeLogInWithGoogleFailure extends Fake implements LogInWithGoogleFailure {}

class FakeLogInWithGoogleCanceled extends Fake implements LogInWithGoogleCanceled {}

class FakeLogInWithTwitterFailure extends Fake implements LogInWithTwitterFailure {}

class FakeLogInWithTwitterCanceled extends Fake implements LogInWithTwitterCanceled {}

class FakeLogInWithFacebookFailure extends Fake implements LogInWithFacebookFailure {}

class FakeLogInWithFacebookCanceled extends Fake implements LogInWithFacebookCanceled {}

class FakeLogOutFailure extends Fake implements LogOutFailure {}

class FakeSendLoginEmailLinkFailure extends Fake implements SendLoginEmailAndPasswordFailure {}

class FakeLogInWithEmailLinkFailure extends Fake implements LogInWithEmailAndPasswordFailure {}

void main() {
  group('UserRepository', () {
    late AuthenticationClient authenticationClient;
    late UserStorage storage;
    late UserRepository userRepository;

    setUp(() {
      authenticationClient = MockAuthenticationClient();
      storage = MockUserStorage();

      userRepository = UserRepository(
        authenticationClient: authenticationClient,
        storage: storage,
      );
    });

    group('user', () {
      test('calls user on AuthenticationClient', () {
        when(() => authenticationClient.user).thenAnswer(
          (_) => const Stream.empty(),
        );
        userRepository.user;
        verify(() => authenticationClient.user).called(1);
      });
    });
    group('logInWithApple', () {
      test('calls logInWithApple on AuthenticationClient', () async {
        when(
          () => authenticationClient.logInWithApple(),
        ).thenAnswer((_) async {});
        await userRepository.logInWithApple();
        verify(() => authenticationClient.logInWithApple()).called(1);
      });

      test('rethrows LogInWithAppleFailure', () async {
        final exception = FakeLogInWithAppleFailure();
        when(
          () => authenticationClient.logInWithApple(),
        ).thenThrow(exception);
        expect(
          () => userRepository.logInWithApple(),
          throwsA(exception),
        );
      });

      test('throws LogInWithAppleFailure on generic exception', () async {
        when(
          () => authenticationClient.logInWithApple(),
        ).thenThrow(Exception());
        expect(
          () => userRepository.logInWithApple(),
          throwsA(isA<LogInWithAppleFailure>()),
        );
      });
    });

    group('logInWithGoogle', () {
      test('calls logInWithGoogle on AuthenticationClient', () async {
        when(
          () => authenticationClient.logInWithGoogle(),
        ).thenAnswer((_) async {});
        await userRepository.logInWithGoogle();
        verify(() => authenticationClient.logInWithGoogle()).called(1);
      });

      test('rethrows LogInWithGoogleFailure', () async {
        final exception = FakeLogInWithGoogleFailure();
        when(() => authenticationClient.logInWithGoogle()).thenThrow(exception);
        expect(() => userRepository.logInWithGoogle(), throwsA(exception));
      });

      test('rethrows LogInWithGoogleCanceled', () async {
        final exception = FakeLogInWithGoogleCanceled();
        when(() => authenticationClient.logInWithGoogle()).thenThrow(exception);
        expect(userRepository.logInWithGoogle(), throwsA(exception));
      });

      test('throws LogInWithGoogleFailure on generic exception', () async {
        when(
          () => authenticationClient.logInWithGoogle(),
        ).thenThrow(Exception());
        expect(
          () => userRepository.logInWithGoogle(),
          throwsA(isA<LogInWithGoogleFailure>()),
        );
      });
    });

    group('logInWithTwitter', () {
      test('calls logInWithTwitter on AuthenticationClient', () async {
        when(
          () => authenticationClient.logInWithTwitter(),
        ).thenAnswer((_) async {});
        await userRepository.logInWithTwitter();
        verify(() => authenticationClient.logInWithTwitter()).called(1);
      });

      test('rethrows LogInWithTwitterFailure', () async {
        final exception = FakeLogInWithTwitterFailure();
        when(() => authenticationClient.logInWithTwitter()).thenThrow(exception);
        expect(() => userRepository.logInWithTwitter(), throwsA(exception));
      });

      test('rethrows LogInWithTwitterCanceled', () async {
        final exception = FakeLogInWithTwitterCanceled();
        when(() => authenticationClient.logInWithTwitter()).thenThrow(exception);
        expect(userRepository.logInWithTwitter(), throwsA(exception));
      });

      test('throws LogInWithTwitterFailure on generic exception', () async {
        when(
          () => authenticationClient.logInWithTwitter(),
        ).thenThrow(Exception());
        expect(
          () => userRepository.logInWithTwitter(),
          throwsA(isA<LogInWithTwitterFailure>()),
        );
      });
    });

    group('logInWithFacebook', () {
      test('calls logInWithFacebook on AuthenticationClient', () async {
        when(
          () => authenticationClient.logInWithFacebook(),
        ).thenAnswer((_) async {});
        await userRepository.logInWithFacebook();
        verify(() => authenticationClient.logInWithFacebook()).called(1);
      });

      test('rethrows LogInWithFacebookFailure', () async {
        final exception = FakeLogInWithFacebookFailure();
        when(() => authenticationClient.logInWithFacebook()).thenThrow(exception);
        expect(() => userRepository.logInWithFacebook(), throwsA(exception));
      });

      test('rethrows LogInWithFacebookCanceled', () async {
        final exception = FakeLogInWithFacebookCanceled();
        when(() => authenticationClient.logInWithFacebook()).thenThrow(exception);
        expect(userRepository.logInWithFacebook(), throwsA(exception));
      });

      test('throws LogInWithFacebookFailure on generic exception', () async {
        when(
          () => authenticationClient.logInWithFacebook(),
        ).thenThrow(Exception());
        expect(
          () => userRepository.logInWithFacebook(),
          throwsA(isA<LogInWithFacebookFailure>()),
        );
      });
    });

    group('logOut', () {
      test('calls logOut on AuthenticationClient', () async {
        when(() => authenticationClient.logOut()).thenAnswer((_) async {});
        await userRepository.logOut();
        verify(() => authenticationClient.logOut()).called(1);
      });

      test('rethrows LogOutFailure', () async {
        final exception = FakeLogOutFailure();
        when(() => authenticationClient.logOut()).thenThrow(exception);
        expect(() => userRepository.logOut(), throwsA(exception));
      });

      test('throws LogOutFailure on generic exception', () async {
        when(() => authenticationClient.logOut()).thenThrow(Exception());
        expect(() => userRepository.logOut(), throwsA(isA<LogOutFailure>()));
      });
    });

    group('UserFailure', () {
      final error = Exception('errorMessage');

      group('FetchAppOpenedCountFailure', () {
        test('has correct props', () {
          expect(FetchAppOpenedCountFailure(error).props, [error]);
        });
      });

      group('IncrementAppOpenedCountFailure', () {
        test('has correct props', () {
          expect(IncrementAppOpenedCountFailure(error).props, [error]);
        });
      });
    });

    group('fetchAppOpenedCount', () {
      test('returns the app opened count from UserStorage ', () async {
        when(storage.fetchAppOpenedCount).thenAnswer((_) async => 1);

        final result = await UserRepository(
          authenticationClient: authenticationClient,
          storage: storage,
        ).fetchAppOpenedCount();
        expect(result, 1);
      });

      test(
          'throws a FetchAppOpenedCountFailure '
          'when fetching app opened count fails', () async {
        when(() => storage.fetchAppOpenedCount()).thenThrow(Exception());

        expect(
          UserRepository(
            authenticationClient: authenticationClient,
            storage: storage,
          ).fetchAppOpenedCount(),
          throwsA(isA<FetchAppOpenedCountFailure>()),
        );
      });
    });

    group('setAppOpenedCount', () {
      test('increments app opened count by 1 in UserStorage', () async {
        when(() => storage.fetchAppOpenedCount()).thenAnswer((_) async => 3);

        when(
          () => storage.setAppOpenedCount(count: 4),
        ).thenAnswer((_) async {});

        await expectLater(
          UserRepository(
            authenticationClient: authenticationClient,
            storage: storage,
          ).incrementAppOpenedCount(),
          completes,
        );
      });

      test(
          'throws a IncrementAppOpenedCountFailure '
          'when setting app opened count fails', () async {
        when(
          () => storage.setAppOpenedCount(count: any(named: 'count')),
        ).thenThrow(Exception());

        expect(
          UserRepository(
            authenticationClient: authenticationClient,
            storage: storage,
          ).incrementAppOpenedCount(),
          throwsA(isA<IncrementAppOpenedCountFailure>()),
        );
      });
    });
  });
}
