import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:listwhatever/app/view/app.dart';
import 'package:listwhatever/pages/lists/components/add_list_form.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_data.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    late MockData mockData;

    setUp(() {
      mockData = MockData()..setup();
    });

    testWidgets('verify that right data is tried to be saved', (tester) async {
      // Load app widget.
      await tester.pumpWidget(
        App(
          authRepository: mockData.authRepository,
          userListRepository: mockData.userListRepository,
          listRepository: mockData.listRepository,
          listItemRepository: mockData.listItemRepository,
          key: const Key('appkey'),
        ),
      );

      when(() => mockData.listRepository.addList(any()))
          .thenAnswer((_) => Future.value('newlistid'));
      when(() => mockData.userListRepository.addUserList(any()))
          .thenAnswer((_) => Future.value('id2'));

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
          verify(() => mockData.listRepository.addList(captureAny())).captured;
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
          verify(() => mockData.userListRepository.addUserList(captureAny()))
              .captured;
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
