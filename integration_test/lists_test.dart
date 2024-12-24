import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:listwhatever/app/view/app.dart';
import 'package:listwhatever/auth/auth_repository.dart';
import 'package:listwhatever/auth/models/authentication_user.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';
import 'package:listwhatever/pages/lists/repository/list_repository.dart';
import 'package:listwhatever/pages/lists/repository/user_list_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockUserListRepository extends Mock implements UserListRepository {}

class MockListRepository extends Mock implements ListRepository {}

class MockUser extends Mock implements User {}

class MockAuthenticationUser extends Mock implements AuthenticationUser {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    late AuthRepository authRepository;
    late UserListRepository userListRepository;
    late MockAuthenticationUser authenticationUser;
    late ListRepository listRepository;

    setUp(() {
      authRepository = MockAuthRepository();
      userListRepository = MockUserListRepository();
      listRepository = MockListRepository();
      authenticationUser = MockAuthenticationUser();

      when(() => authRepository.user)
          .thenAnswer((_) => Stream.value(authenticationUser).take(1));

      when(() => authenticationUser.isAnonymous()).thenReturn(false);
      when(() => authenticationUser.id).thenReturn('abcXYZ');

      when(() => userListRepository.loadUserLists()).thenAnswer(
        (_) => Stream.value([
          const UserList(
            id: 'id1',
            listId: 'listId1',
            listName: 'First list',
            imageFilename: 'assets/images/restaurants.jpeg',
            ownerId: 'ownerId',
            isOwnList: true,
          ),
          const UserList(
            id: 'id2',
            listId: 'listId2',
            listName: 'Second list',
            imageFilename: 'assets/images/restaurants.jpeg',
            ownerId: 'ownerId',
            isOwnList: true,
          ),
        ]).take(1),
      );
    });

    tearDown(() async {
      // Close any open connections, cancel timers, etc.  For example:
    });

    testWidgets('verify that list of UserLists show up', (tester) async {
      await tester.pumpWidget(
        App(
          authRepository: authRepository,
          userListRepository: userListRepository,
          listRepository: listRepository,
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));

      final tile1 = find.text('First list');
      expect(tile1, findsOneWidget);

      final tile2 = find.text('Second list');
      expect(tile2, findsOneWidget);
    });
  });
}
