// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listwhatever/custom/pages/listItems/addListItem/add_list_item_page.dart';
import 'package:listwhatever/custom/pages/lists/addList/add_list_page.dart';

void main() {
  group('AddListItemPage', () {
    late AddListPage addListPage;

    setUp(() {
      addListPage = AddListPage();
    });

    testWidgets('AddListPage shows up', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(MaterialApp(
        home: AddListPage(), // Replace with your page widget
      ));

      // Verify that the page is shown by checking for a specific widget
      expect(find.byType(AddListPage), findsOneWidget);
    });
  });
}
