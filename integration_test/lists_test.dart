import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:listwhatever/app/view/app.dart';
import 'package:listwhatever/auth/auth_repository.dart';
import 'package:listwhatever/auth/models/authentication_user.dart';
import 'package:listwhatever/pages/list/pages/list_page.dart';
import 'package:listwhatever/pages/lists/components/user_list_tile.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';
import 'package:listwhatever/pages/lists/repository/user_list_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockUserListRepository extends Mock implements UserListRepository {}

class MockUser extends Mock implements User {}

class MockAuthenticationUser extends Mock implements AuthenticationUser {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    late AuthRepository authRepository;
    late UserListRepository userListRepository;
    late MockAuthenticationUser authenticationUser;

    setUp(() {
      authRepository = MockAuthRepository();
      userListRepository = MockUserListRepository();
      authenticationUser = MockAuthenticationUser();

      when(() => authRepository.user)
          .thenAnswer((_) => Stream.value(authenticationUser));

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
        ]),
      );
    });

    testWidgets('verify that list of UserLists show up', (tester) async {
      await tester.pumpWidget(
        App(
          authRepository: authRepository,
          userListRepository: userListRepository,
        ),
      );
      await tester.pumpAndSettle();
      final actionButton = find.byType(UserListTile);
      expect(actionButton, findsOneWidget);
    });
  });
}
