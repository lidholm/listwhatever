import 'package:flutter_test/flutter_test.dart';
import 'package:listanything/app/pages/list_items/filter_list_items.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';

void main() {
  final emptyList = <ListItem>[];
  final emptyFilters = <String, List<String?>>{};
  group('filter items', () {
    test('return no items when no items exists', () {
      expect(filterListItems([], emptyFilters), equals(<ListItem>[]));
      expect(
        filterListItems(
          [],
          {
            'category1': ['value1', 'value2']
          },
        ),
        equals(emptyList),
      );
    });

    test('return all items when no filters exists', () {
      var input = createListItemWithSpecifiedName('First');
      input = addCategoryAndValueToMapItem(input, 'some', 'value');
      final filters = <String, List<String?>>{};
      expect(filterListItems([input], filters), equals([input]));
    });

    test('return all items when no filters exists with values', () {
      var input = createListItemWithSpecifiedName('First');
      input = addCategoryAndValueToMapItem(input, 'some', 'value');
      final filters = <String, List<String?>>{'some': []};
      expect(filterListItems([input], filters), equals([input]));
    });

    test('return the item when filter specifies the one category correctly', () {
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'A');
      final input = [firstItem];
      final filters = <String, List<String?>>{
        'type': ['A']
      };
      expect(filterListItems(input, filters), equals(input));
    });

    test('return no items when filter specifies the one category incorrectly', () {
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'A');
      final input = [firstItem];
      final filters = <String, List<String?>>{
        'type': ['B']
      };
      expect(filterListItems(input, filters), equals(emptyList));
    });

    test('return the items when filter specifies something item does not have', () {
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'A');
      final input = [firstItem];
      final filters = <String, List<String?>>{
        'type': ['A'],
        'price': ['high']
      };
      expect(filterListItems(input, filters), equals(input));
    });

    test('return the item when filter specifies multiple values for a category and item only has one', () {
      //TOOD(lidholm): Is this the wanted behavior?
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'B');
      final input = [firstItem];
      final filters = <String, List<String?>>{
        'type': ['A', 'B']
      };
      expect(filterListItems(input, filters), equals(input));
    });
    test('return the item when filter specifies a value and item has multiple values for it', () {
      //TOOD(lidholm): Is this the wanted behavior?
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'B');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'C');
      var secondItem = createListItemWithSpecifiedName('Second');
      secondItem = addCategoryAndValueToMapItem(secondItem, 'type', 'B');
      var thirdItem = createListItemWithSpecifiedName('Third');
      thirdItem = addCategoryAndValueToMapItem(thirdItem, 'type', 'C');

      final input = [firstItem, secondItem, thirdItem];
      final filters = <String, List<String?>>{
        'type': ['A', 'B']
      };
      expect(filterListItems(input, filters), equals([firstItem, secondItem]));
    });
    test('special', () {
      //TOOD(lidholm): Is this the wanted behavior?
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'B');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'other', 'X');
      var secondItem = createListItemWithSpecifiedName('Second');
      secondItem = addCategoryAndValueToMapItem(secondItem, 'type', 'B');
      secondItem = addCategoryAndValueToMapItem(secondItem, 'other', 'X');
      var thirdItem = createListItemWithSpecifiedName('Third');
      thirdItem = addCategoryAndValueToMapItem(thirdItem, 'type', 'C');
      thirdItem = addCategoryAndValueToMapItem(thirdItem, 'other', 'X');

      final input = [firstItem, secondItem, thirdItem];
      final filters = <String, List<String?>>{
        'type': ['B']
      };
      expect(filterListItems(input, filters), equals([firstItem, secondItem]));
    });
  });
}

ListItem createListItemWithSpecifiedName(String name) => ListItem(
      name: name,
      categories: {},
    );

ListItem addCategoryAndValueToMapItem(ListItem item, String categoryName, String categoryValue) {
  final m1 = {
    categoryName: [categoryValue]
  };
  if (item.categories.containsKey(categoryName)) {
    return item.copyWith(
      categories: Map.fromEntries(
        item.categories.entries.map(
          (e) => e.key == categoryName ? MapEntry(e.key, e.value) : MapEntry(e.key, [...e.value, categoryValue]),
        ),
      ),
    );
  }
  return item.copyWith(categories: {...item.categories, ...m1});
}
