import 'package:flutter_test/flutter_test.dart';
import 'package:great_circle_distance_calculator/great_circle_distance_calculator.dart';
import 'package:listwhatever/custom/pages/listItems/filters/filter_list_items.dart';
import 'package:listwhatever/custom/pages/listItems/filters/filters.dart';
import 'package:listwhatever/custom/pages/listItems/models/list_item.dart';
import 'package:listwhatever/custom/pages/listItems/searchLocation/geocoder/latlong.dart';
import 'package:listwhatever/standard/constants.dart';

void main() {
  final emptyList = <ListItem>[];
  final emptyFilters = Filters(
    categoryFilters: <String, List<String>>{},
  );
  group('filter items', () {
    test('return no items when no items exists', () {
      expect(
        filterListItems(
          allItems: [],
          filters: emptyFilters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals(<ListItem>[]),
      );
      expect(
        filterListItems(
          allItems: [],
          filters: Filters(
            categoryFilters: {
              'category1': ['value1', 'value2'],
            },
          ),
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals(emptyList),
      );
    });

    test('return all items when no filters exists', () {
      var input = createListItemWithSpecifiedName('First');
      input = addCategoryAndValueToMapItem(input, 'some', 'value');
      expect(
        filterListItems(
          allItems: [input],
          filters: emptyFilters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals([input]),
      );
    });

    test('return all items when no filters exists with values', () {
      var item1 = createListItemWithSpecifiedName('First');
      item1 = addCategoryAndValueToMapItem(item1, 'some', 'value');
      final filters = Filters(categoryFilters: <String, List<String>>{'some': []});
      expect(
        filterListItems(
          allItems: [item1],
          filters: filters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals([item1]),
      );
    });

    test('return the item when filter specifies the one category correctly', () {
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'A');
      final input = [firstItem];
      final filters = Filters(
        categoryFilters: <String, List<String>>{
          'type': ['A'],
        },
      );
      expect(
        filterListItems(
          allItems: input,
          filters: filters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals(input),
      );
    });

    test('return no items when filter specifies the one category incorrectly', () {
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'A');
      final input = [firstItem];
      final filters = Filters(
        categoryFilters: <String, List<String>>{
          'type': ['B'],
        },
      );
      expect(
        filterListItems(
          allItems: input,
          filters: filters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals(emptyList),
      );
    });

    test('return the items when filter specifies something item does not have', () {
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'A');
      final input = [firstItem];
      final filters = Filters(
        categoryFilters: <String, List<String>>{
          'type': ['A'],
          'price': ['high'],
        },
      );
      expect(
        filterListItems(
          allItems: input,
          filters: filters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals(input),
      );
    });

    test('return the item when filter specifies multiple values for a category and item only has one', () {
      //TOOD(lidholm): Is this the wanted behavior?
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'B');
      final input = [firstItem];
      final filters = Filters(
        categoryFilters: <String, List<String>>{
          'type': ['A', 'B'],
        },
      );
      expect(
        filterListItems(
          allItems: input,
          filters: filters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals(input),
      );
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
          'type': ['A', 'B'],
        },
      );
      expect(
        filterListItems(
          allItems: input,
          filters: filters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals([firstItem, secondItem]),
      );
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
        filterListItems(
          allItems: input,
          filters: filters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
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
      final actual = filterListItems(
        allItems: input,
        filters: filters,
        listHasDates: true,
        listHasMap: false,
        distanceFilterCenter: null,
      );
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
      final actual = filterListItems(
        allItems: input,
        filters: filters,
        listHasDates: true,
        listHasMap: false,
        distanceFilterCenter: null,
      );
      expect(actual, equals([secondItem, thirdItem, fourthItem]));
    });

    test("return the item when the items date is between the filter's start date and end date", () {
      final firstItem = createListItemWithSpecifiedName('First').copyWith(datetime: DateTime.parse('2023-05-21'));
      final secondItem = createListItemWithSpecifiedName('Second').copyWith(datetime: DateTime.parse('2023-05-19'));
      final thirdItem = createListItemWithSpecifiedName('Third').copyWith(datetime: DateTime.parse('2023-05-20'));
      final fourthItem = createListItemWithSpecifiedName('Third').copyWith(datetime: DateTime.parse('2023-05-22'));
      final fifthItem = createListItemWithSpecifiedName('Third').copyWith(datetime: DateTime.parse('2023-05-23'));
      final sixthItem = createListItemWithSpecifiedName('Fourth');

      final input = [
        firstItem,
        secondItem,
        thirdItem,
        fourthItem,
        fifthItem,
        sixthItem,
      ];
      final filters = Filters(
        startDate: DateTime.parse('2023-05-20'),
        endDate: DateTime.parse('2023-05-22'),
        categoryFilters: {},
      );
      final actual = filterListItems(
        allItems: input,
        filters: filters,
        listHasDates: true,
        listHasMap: false,
        distanceFilterCenter: null,
      );
      expect(actual, equals([firstItem, thirdItem, fourthItem, sixthItem]));
    });

    test('distance', () {
      const lat1 = 41.139129;
      const lon1 = 1.402244;

      const lat2 = 41.139074;
      const lon2 = 1.402315;

      final gcd = GreatCircleDistance.fromDegrees(
        latitude1: lat1,
        longitude1: lon1,
        latitude2: lat2,
        longitude2: lon2,
      );

      logger
        ..i(
          'Distance from location 1 to 2 using the Haversine formula is: ${gcd.haversineDistance()} meters',
        )
        ..i(
          'Distance from location 1 to 2 using the Spherical Law of Cosines is: ${gcd.sphericalLawOfCosinesDistance()} meters',
        )
        ..i(
          'Distance from location 1 to 2 using the Vicenty`s formula is: ${gcd.vincentyDistance()} meters',
        );
    });

    test('return the item when distance is within filter', () {
      final firstItem = createListItemWithSpecifiedName('First').copyWith(latLong: const LatLong(lat: 0.001, lng: 0));
      final secondItem = createListItemWithSpecifiedName('Second').copyWith(latLong: const LatLong(lat: 0.002, lng: 0));
      final thirdItem = createListItemWithSpecifiedName('Third');

      final input = [firstItem, secondItem, thirdItem];
      final filters = Filters(
        categoryFilters: {},
        distance: 150,
      );
      expect(
        filterListItems(
          allItems: input,
          filters: filters,
          listHasMap: true,
          listHasDates: false,
          distanceFilterCenter: const LatLong(lat: 0, lng: 0),
        ),
        equals([firstItem, thirdItem]),
      );
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
          'type': ['B'],
        },
      );
      expect(
        filterListItems(
          allItems: input,
          filters: filters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals([firstItem, secondItem]),
      );
    });
  });
}

ListItem createListItemWithSpecifiedName(String name) => ListItem(
      id: 'as',
      name: name,
      categories: {},
    );

ListItem addCategoryAndValueToMapItem(
  ListItem item,
  String categoryName,
  String categoryValue,
) {
  final m1 = {
    categoryName: [categoryValue],
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
