// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter_test/flutter_test.dart';
import 'package:listwhatever/custom/pages/listItems/addListItem/add_list_item_page.dart';

void main() {
  group('AddListItemPage', () {
    late AddListItemPage addListItemPage;

    setUp(() {
      addListItemPage = AddListItemPage(actualListId: 'a');
    });

    //   test('get categories from filled in values', () {
    //     final values = <String, dynamic>{
    //       '${AddListItemValues.categoryKeys}-0': 'color',
    //       '${AddListItemValues.categoryKeys}-1': 'size',
    //       'somethingElse': 'color',
    //       '${AddListItemValues.categoryValues}-0': 'red, orange',
    //       '${AddListItemValues.categoryValues}-1': 'small,large,x-large',
    //     };

    //     expect(
    //       addListItemPage.getCategories(values),
    //       equals({
    //         'color': ['red', 'orange'],
    //         'size': ['small', 'large', 'x-large'],
    //       }),
    //     );
    //   });
  });
}
