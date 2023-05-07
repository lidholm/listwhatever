import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listanything/app/firebase/firebase_auth_provider.dart';
import 'package:listanything/app/firebase/firestore_user.dart';
import 'package:listanything/app/navigation/current_user_provider.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rxdart/rxdart.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

MockUser createMockUser(String uid) {
  final user = MockUser();
  when(() => user.uid).thenReturn(uid);
  when(() => user.email).thenReturn(uid);
  when(() => user.displayName).thenReturn(uid);
  return user;
}

final firestoreUsers = [
  FirestoreUser(uid: 'uid-1', email: 'user1@email.com'),
  FirestoreUser(uid: 'uid-2', email: 'user2@email.com'),
  FirestoreUser(uid: 'uid-3', email: 'user3@email.com'),
];

final mockFirestoreUserProvider =
    StreamProvider.family<FirestoreUser?, String>((ref, userId) async* {
  yield* Stream.value(
    firestoreUsers.firstWhere((element) => element.uid == userId),
  );
});

void main() {
  final mockFirebaseAuth = MockFirebaseAuth();
  final mockUser1 = createMockUser('uid-1');
  final mockUser2 = createMockUser('uid-2');
  final mockUser3 = createMockUser('uid-3');
  final authDataStreamSubject = BehaviorSubject<User>();
  final authDataStream = authDataStreamSubject.stream;

  setUp(() {
    when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser1);
    when(mockFirebaseAuth.userChanges).thenAnswer((_) => authDataStream);
    when(mockFirebaseAuth.userChanges).thenAnswer((_) => authDataStream);
  });

  List<String?> getTextWidgetTexts(WidgetTester tester) {
    return tester
        .widgetList(find.byType(Text))
        .map((w) => (w as Text).data)
        .toList();
  }

  testWidgets('override repositoryProvider', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          firebaseAuthProvider
              .overrideWith((ref) => Future.value(mockFirebaseAuth)),
          userProvider.overrideWithProvider(mockFirestoreUserProvider.call)
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (context, ref, _) {
                final user = ref.watch(currentUserProvider);
                print('user: $user');
                print('user.asData: ${user.asData}');
                if (user.asData == null) {
                  return const Text('Loading');
                }
                print('user.asData!.value?.uid: ${user.asData!.value?.uid}');
                return Text(user.asData!.value?.uid ?? 'No user');
              },
            ),
          ),
        ),
      ),
    );

    expect(getTextWidgetTexts(tester), ['Loading']);
    await tester.pump(Duration.zero);
    await tester.pump(Duration.zero);
    expect(getTextWidgetTexts(tester), ['uid-1']);

    authDataStreamSubject.add(mockUser2);
    await tester.pump(Duration.zero);
    await tester.pump(Duration.zero);
    expect(getTextWidgetTexts(tester), ['uid-2']);

    authDataStreamSubject.add(mockUser3);
    await tester.pump(Duration.zero);
    await tester.pump(Duration.zero);
    expect(getTextWidgetTexts(tester), ['uid-3']);
  });
}
