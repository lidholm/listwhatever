import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:listwhatever/app/view/app.dart';
import 'package:listwhatever/auth/auth_repository.dart';
import 'package:listwhatever/auth/models/authentication_user.dart';
import 'package:listwhatever/pages/list/repository/list_item_repository.dart';
import 'package:listwhatever/pages/lists/components/add_list_form.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';
import 'package:listwhatever/pages/lists/repository/list_repository.dart';
import 'package:listwhatever/pages/lists/repository/user_list_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockUserListRepository extends Mock implements UserListRepository {}

class MockListRepository extends Mock implements ListRepository {}

class MockListItemRepository extends Mock implements ListItemRepository {}

class MockUser extends Mock implements User {}

class MockUserList extends Mock implements UserList {}

class MockListOfThings extends Mock implements ListOfThings {}

class MockAuthenticationUser extends Mock implements AuthenticationUser {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    late AuthRepository authRepository;
    late UserListRepository userListRepository;
    late ListRepository listRepository;
    late MockAuthenticationUser authenticationUser;
    late ListItemRepository listItemRepository;

    setUpAll(() {
      registerFallbackValue(MockUserList());
      registerFallbackValue(MockListOfThings());
    });

    setUp(() {
      authRepository = MockAuthRepository();
      userListRepository = MockUserListRepository();
      listRepository = MockListRepository();
      authenticationUser = MockAuthenticationUser();
      listItemRepository = MockListItemRepository();

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
      when(() => userListRepository.addUserList(any()))
          .thenAnswer((_) => Future.value('newuserlistid'));
      when(() => listRepository.addList(any()))
          .thenAnswer((_) => Future.value('newlistid'));
    });

    testWidgets('verify that right data is tried to be saved', (tester) async {
      // Load app widget.
      await tester.pumpWidget(
        App(
          authRepository: authRepository,
          userListRepository: userListRepository,
          listRepository: listRepository,
          listItemRepository: listItemRepository,
          key: const Key('appkey'),
        ),
      );
      // Finds the floating action button to tap on.
      // final actionButton = find.byKey(addListButtonKey);
      final actionButton = find.byType(FloatingActionButton);
      expect(actionButton, findsOneWidget);

      // Emulate a tap on the floating action button.
      await tester.tap(actionButton);
      await tester.pump(const Duration(milliseconds: 300));

      final nameTextInput = find.byKey(Key(FieldId.name.value));
      expect(nameTextInput, findsExactly(1));
      await tester.enterText(nameTextInput, 'My New List Name');

      await tester.pump(const Duration(milliseconds: 1000));

      final submitButton = find.byKey(Key(FieldId.submit.value));
      expect(submitButton, findsExactly(1));
      await tester.tap(submitButton);

      final formState = addListFormKey.currentState!;
      print(formState);
      expect(formState.value[FieldId.name.value], 'My New List Name');

      final capturedList =
          verify(() => listRepository.addList(captureAny())).captured;
      expect(
        capturedList.last,
        equals(
          const ListOfThings(
            id: null,
            name: 'My New List Name',
            withMap: false,
            withDates: false,
            withTimes: false,
            shared: false,
            sharedWith: {},
            ownerId: null, // TODO: Change
          ),
        ),
      );

      final capturedUserList =
          verify(() => userListRepository.addUserList(captureAny())).captured;
      expect(
        capturedUserList.last,
        equals(
          const UserList(
            id: null,
            listId: 'newlistid',
            listName: 'My New List Name',
            imageFilename: '',
            ownerId: 'Fix',
            isOwnList: true,
          ),
        ),
      );
    });
  });
}
