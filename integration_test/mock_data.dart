import 'package:firebase_auth/firebase_auth.dart';

import 'package:listwhatever/auth/auth_repository.dart';
import 'package:listwhatever/auth/bloc/auth_bloc.dart';
import 'package:listwhatever/auth/models/authentication_user.dart';
import 'package:listwhatever/pages/list/bloc/list_bloc.dart';
import 'package:listwhatever/pages/list/repository/list_item_repository.dart';
import 'package:listwhatever/pages/lists/bloc/lists_bloc.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';
import 'package:listwhatever/pages/lists/repository/list_repository.dart';
import 'package:listwhatever/pages/lists/repository/user_list_repository.dart';
import 'package:mocktail/mocktail.dart';

import 'add_list_item_test.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockUserListRepository extends Mock implements UserListRepository {}

class MockListRepository extends Mock implements ListRepository {}

class MockListItemRepository extends Mock implements ListItemRepository {}

class MockUser extends Mock implements User {}

class MockAuthenticationUser extends Mock implements AuthenticationUser {}

class MockData {
  late MockAuthRepository authRepository;
  late MockUserListRepository userListRepository;
  late MockListRepository listRepository;
  late MockAuthenticationUser authenticationUser;
  late MockListItemRepository listItemRepository;
  late ListBloc listBloc;
  late ListsBloc listsBloc;
  late AuthBloc authBloc;

  void setup() {
    authRepository = MockAuthRepository();
    userListRepository = MockUserListRepository();
    listRepository = MockListRepository();
    authenticationUser = MockAuthenticationUser();
    listItemRepository = MockListItemRepository();
    listBloc = MockListBloc();
    listsBloc = MockListsBloc();
    authBloc = MockAuthBloc();

    registerFallbackValue(MockUserList());
    registerFallbackValue(MockListOfThings());

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
}
