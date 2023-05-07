import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listanything/app/firebase/firebase_auth_provider.dart';
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

void main() {
  final mockFirebaseAuth = MockFirebaseAuth();
  final mockUser1 = createMockUser('uid-1');
  final mockUser2 = createMockUser('uid-2');
  final mockUser3 = createMockUser('uid-3');
  // final mockUser4 = createMockUser('uid-4');
  // final mockUser5 = createMockUser('uid-5');
  final dataStreamSubject = BehaviorSubject<User>();
  final dataStream = dataStreamSubject.stream;

  setUp(() {
    when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser1);
    when(mockFirebaseAuth.userChanges).thenAnswer((_) => dataStream);
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
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (context, ref, _) {
                final user = ref.watch(currentUserProvider);
                print('user: $user');
                print('user.asData: ${user.asData}');
                if (user.asData == null) {
                  return const CircularProgressIndicator();
                }
                print('user.asData!.value?.uid: ${user.asData!.value?.uid}');
                return Text(user.asData!.value?.uid ?? 'No user');
              },
            ),
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pump(Duration.zero);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(getTextWidgetTexts(tester), ['uid-1']);

    dataStreamSubject.add(mockUser2);
    await tester.pump(Duration.zero);
    await tester.pump(Duration.zero);
    expect(getTextWidgetTexts(tester), ['uid-2']);

    dataStreamSubject.add(mockUser3);
    await tester.pump(Duration.zero);
    await tester.pump(Duration.zero);
    expect(getTextWidgetTexts(tester), ['uid-3']);
  });
}
