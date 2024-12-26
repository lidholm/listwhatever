import 'package:firebase_auth/firebase_auth.dart';

import 'package:listwhatever/auth/auth_repository.dart';
import 'package:listwhatever/auth/models/authentication_user.dart';
import 'package:listwhatever/pages/list/repository/list_item_repository.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';
import 'package:listwhatever/pages/lists/repository/list_repository.dart';
import 'package:listwhatever/pages/lists/repository/user_list_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockUserListRepository extends Mock implements UserListRepository {}

class MockListRepository extends Mock implements ListRepository {}

class MockListItemRepository extends Mock implements ListItemRepository {}

class MockUser extends Mock implements User {}

class MockAuthenticationUser extends Mock implements AuthenticationUser {}

class MockData {
  MockData() {
    when(() => authRepository.user)
        .thenAnswer((_) => Stream.value(authenticationUser).take(1));

    when(authenticationUser.isAnonymous).thenReturn(false);
    when(() => authenticationUser.id).thenReturn('abcXYZ');

    when(userListRepository.loadUserLists).thenAnswer(
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
  }
  final authRepository = MockAuthRepository();
  final userListRepository = MockUserListRepository();
  final listRepository = MockListRepository();
  final authenticationUser = MockAuthenticationUser();
  final listItemRepository = MockListItemRepository();
}
