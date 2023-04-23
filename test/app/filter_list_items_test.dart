import 'package:flutter_test/flutter_test.dart';
import 'package:listanything/app/pages/list_items/filter_list_items.dart';
import 'package:listanything/app/pages/list_items/filters.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';

void main() {
  final emptyList = <ListItem>[];
  final emptyFilters = Filters(
    categoryFilters: <String, List<String>>{},
  );
  group('filter items', () {
    test('return no items when no items exists', () {
      expect(filterListItems(allItems: [], filters: emptyFilters, listHasDates: true), equals(<ListItem>[]));
      expect(
        filterListItems(
          allItems: [],
          filters: Filters(
            categoryFilters: {
              'category1': ['value1', 'value2']
            },
          ),
          listHasDates: true,
        ),
        equals(emptyList),
      );
    });

    test('return all items when no filters exists', () {
      var input = createListItemWithSpecifiedName('First');
      input = addCategoryAndValueToMapItem(input, 'some', 'value');
      expect(filterListItems(allItems: [input], filters: emptyFilters, listHasDates: true), equals([input]));
    });

    test('return all items when no filters exists with values', () {
      var input = createListItemWithSpecifiedName('First');
      input = addCategoryAndValueToMapItem(input, 'some', 'value');
      final filters = Filters(categoryFilters: <String, List<String>>{'some': []});
      expect(filterListItems(allItems: [input], filters: filters, listHasDates: true), equals([input]));
    });

    test('return the item when filter specifies the one category correctly', () {
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'A');
      final input = [firstItem];
      final filters = Filters(
        categoryFilters: <String, List<String>>{
          'type': ['A']
        },
      );
      expect(filterListItems(allItems: input, filters: filters, listHasDates: true), equals(input));
    });

    test('return no items when filter specifies the one category incorrectly', () {
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'A');
      final input = [firstItem];
      final filters = Filters(
        categoryFilters: <String, List<String>>{
          'type': ['B']
        },
      );
      expect(filterListItems(allItems: input, filters: filters, listHasDates: true), equals(emptyList));
    });

    test('return the items when filter specifies something item does not have', () {
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'A');
      final input = [firstItem];
      final filters = Filters(
        categoryFilters: <String, List<String>>{
          'type': ['A'],
          'price': ['high']
        },
      );
      expect(filterListItems(allItems: input, filters: filters, listHasDates: true), equals(input));
    });

    test('return the item when filter specifies multiple values for a category and item only has one', () {
      //TOOD(lidholm): Is this the wanted behavior?
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'B');
      final input = [firstItem];
      final filters = Filters(
        categoryFilters: <String, List<String>>{
          'type': ['A', 'B']
        },
      );
      expect(filterListItems(allItems: input, filters: filters, listHasDates: true), equals(input));
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
      final filters = Filters(
        categoryFilters: <String, List<String>>{
          'type': ['A', 'B']
        },
      );
      expect(filterListItems(allItems: input, filters: filters, listHasDates: true), equals([firstItem, secondItem]));
    });

    test('return the item when no date filters exist', () {
      final firstItem = createListItemWithSpecifiedName('First').copyWith(datetime: DateTime.parse('2023-05-21'));
      final secondItem = createListItemWithSpecifiedName('Second').copyWith(datetime: DateTime.parse('2023-05-01'));
      final thirdItem = createListItemWithSpecifiedName('Third').copyWith(datetime: DateTime.parse('2023-05-20'));
      final fourthItem = createListItemWithSpecifiedName('Fourth');

      final input = [firstItem, secondItem, thirdItem, fourthItem];
      final filters = Filters(
        categoryFilters: {},
      );
      expect(
        filterListItems(allItems: input, filters: filters, listHasDates: true),
        equals([firstItem, secondItem, thirdItem, fourthItem]),
      );
    });

    test('return the item when filter specifies a start date that is before the items date', () {
      final firstItem = createListItemWithSpecifiedName('First').copyWith(datetime: DateTime.parse('2023-05-21'));
      final secondItem = createListItemWithSpecifiedName('Second').copyWith(datetime: DateTime.parse('2023-05-01'));
      final thirdItem = createListItemWithSpecifiedName('Third').copyWith(datetime: DateTime.parse('2023-05-20'));
      final fourthItem = createListItemWithSpecifiedName('Fourth');

      final input = [firstItem, secondItem, thirdItem, fourthItem];
      final filters = Filters(
        startDate: DateTime.parse('2023-05-20'),
        categoryFilters: {},
      );
      final actual = filterListItems(allItems: input, filters: filters, listHasDates: true);
      expect(actual, equals([firstItem, thirdItem, fourthItem]));
    });

    test('return the item when filter specifies a end date that is after the items date', () {
      final firstItem = createListItemWithSpecifiedName('First').copyWith(datetime: DateTime.parse('2023-05-21'));
      final secondItem = createListItemWithSpecifiedName('Second').copyWith(datetime: DateTime.parse('2023-05-01'));
      final thirdItem = createListItemWithSpecifiedName('Third').copyWith(datetime: DateTime.parse('2023-05-20'));
      final fourthItem = createListItemWithSpecifiedName('Fourth');

      final input = [firstItem, secondItem, thirdItem, fourthItem];
      final filters = Filters(
        endDate: DateTime.parse('2023-05-20'),
        categoryFilters: {},
      );
      final actual = filterListItems(allItems: input, filters: filters, listHasDates: true);
      expect(actual, equals([secondItem, thirdItem, fourthItem]));
    });

    test("return the item when the items date is between the filter's start date and end date", () {
      final firstItem = createListItemWithSpecifiedName('First').copyWith(datetime: DateTime.parse('2023-05-21'));
      final secondItem = createListItemWithSpecifiedName('Second').copyWith(datetime: DateTime.parse('2023-05-19'));
      final thirdItem = createListItemWithSpecifiedName('Third').copyWith(datetime: DateTime.parse('2023-05-20'));
      final fourthItem = createListItemWithSpecifiedName('Third').copyWith(datetime: DateTime.parse('2023-05-22'));
      final fifthItem = createListItemWithSpecifiedName('Third').copyWith(datetime: DateTime.parse('2023-05-23'));
      final sixthItem = createListItemWithSpecifiedName('Fourth');

      final input = [firstItem, secondItem, thirdItem, fourthItem, fifthItem, sixthItem];
      final filters = Filters(
        startDate: DateTime.parse('2023-05-20'),
        endDate: DateTime.parse('2023-05-22'),
        categoryFilters: {},
      );
      final actual = filterListItems(allItems: input, filters: filters, listHasDates: true);
      expect(actual, equals([firstItem, thirdItem, fourthItem, sixthItem]));
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
      final filters = Filters(
        categoryFilters: <String, List<String>>{
          'type': ['B']
        },
      );
      expect(filterListItems(allItems: input, filters: filters, listHasDates: true), equals([firstItem, secondItem]));
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
