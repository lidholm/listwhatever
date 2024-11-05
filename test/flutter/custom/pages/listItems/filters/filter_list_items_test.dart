import 'package:flutter_test/flutter_test.dart';
import 'package:great_circle_distance_calculator/great_circle_distance_calculator.dart';
import 'package:listwhatever/custom/pages/listItems/filters/filtering.dart';
import 'package:listwhatever/custom/pages/listItems/filters/filters.dart';
import 'package:listwhatever/custom/pages/listItems/models/list_item.dart';
import 'package:listwhatever/custom/pages/listItems/searchLocation/geocoder/latlong.dart';
import 'package:listwhatever/standard/helpers/date_helper.dart';
import 'package:listwhatever/standard/helpers/logger_helper.dart';

void main() {
  final emptyList = <ListItem>[];
  final emptyFilters = Filters(
    regularCategoryFilters: <String, Set<String>>{},
  );
  group('filter items', () {
    test('return no items when no items exists', () {
      expect(
        Filtering.filterListItems(
          allItems: [],
          filters: emptyFilters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals(<ListItem>[]),
      );
      expect(
        Filtering.filterListItems(
          allItems: [],
          filters: Filters(
            regularCategoryFilters: {
              'category1': {'value1', 'value2'},
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
        Filtering.filterListItems(
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
      final filters =
          Filters(regularCategoryFilters: <String, Set<String>>{'some': {}});
      expect(
        Filtering.filterListItems(
          allItems: [item1],
          filters: filters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals([item1]),
      );
    });

    test('return the item when filter specifies the one category correctly',
        () {
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'A');
      final input = [firstItem];
      final filters = Filters(
        regularCategoryFilters: <String, Set<String>>{
          'type': {'A'},
        },
      );
      expect(
        Filtering.filterListItems(
          allItems: input,
          filters: filters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals(input),
      );
    });

    test('return no items when filter specifies the one category incorrectly',
        () {
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'A');
      final input = [firstItem];
      final filters = Filters(
        regularCategoryFilters: <String, Set<String>>{
          'type': {'B'},
        },
      );
      expect(
        Filtering.filterListItems(
          allItems: input,
          filters: filters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals(emptyList),
      );
    });

    test('return the items when filter specifies something item does not have',
        () {
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'A');
      final input = [firstItem];
      final filters = Filters(
        regularCategoryFilters: <String, Set<String>>{
          'type': {'A'},
          'price': {'high'},
        },
      );
      expect(
        Filtering.filterListItems(
          allItems: input,
          filters: filters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals(input),
      );
    });

    test(
        'return the item when filter specifies multiple values for a category and item only has one',
        () {
      //TOOD(lidholm): Is this the wanted behavior?
      var firstItem = createListItemWithSpecifiedName('First');
      firstItem = addCategoryAndValueToMapItem(firstItem, 'type', 'B');
      final input = [firstItem];
      final filters = Filters(
        regularCategoryFilters: <String, Set<String>>{
          'type': {'A', 'B'},
        },
      );
      expect(
        Filtering.filterListItems(
          allItems: input,
          filters: filters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals(input),
      );
    });

    test(
        'return the item when filter specifies a value and item has multiple values for it',
        () {
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
        regularCategoryFilters: <String, Set<String>>{
          'type': {'A', 'B'},
        },
      );
      expect(
        Filtering.filterListItems(
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
      final firstItem = createListItemWithSpecifiedName('First')
          .copyWith(datetime: DateTime.parse('2023-05-21'));
      final secondItem = createListItemWithSpecifiedName('Second')
          .copyWith(datetime: DateTime.parse('2023-05-01'));
      final thirdItem = createListItemWithSpecifiedName('Third')
          .copyWith(datetime: DateTime.parse('2023-05-20'));
      final fourthItem = createListItemWithSpecifiedName('Fourth');

      final input = [firstItem, secondItem, thirdItem, fourthItem];
      final filters = Filters(
        regularCategoryFilters: {},
      );
      expect(
        Filtering.filterListItems(
          allItems: input,
          filters: filters,
          listHasDates: true,
          listHasMap: false,
          distanceFilterCenter: null,
        ),
        equals([firstItem, secondItem, thirdItem, fourthItem]),
      );
    });

    test(
        'return the item when filter specifies a start date that is before the items date',
        () {
      final firstItem = createListItemWithSpecifiedName('First')
          .copyWith(datetime: DateTime.parse('2023-05-21'));
      final secondItem = createListItemWithSpecifiedName('Second')
          .copyWith(datetime: DateTime.parse('2023-05-01'));
      final thirdItem = createListItemWithSpecifiedName('Third')
          .copyWith(datetime: DateTime.parse('2023-05-20'));
      final fourthItem = createListItemWithSpecifiedName('Fourth');

      final input = [firstItem, secondItem, thirdItem, fourthItem];
      final filters = Filters(
        startDate: DateTime.parse('2023-05-20'),
        regularCategoryFilters: {},
      );
      final actual = Filtering.filterListItems(
        allItems: input,
        filters: filters,
        listHasDates: true,
        listHasMap: false,
        distanceFilterCenter: null,
      );
      expect(actual, equals([firstItem, thirdItem, fourthItem]));
    });

    test(
        'return the item when filter specifies a end date that is after the items date',
        () {
      final firstItem = createListItemWithSpecifiedName('First')
          .copyWith(datetime: DateTime.parse('2023-05-21'));
      final secondItem = createListItemWithSpecifiedName('Second')
          .copyWith(datetime: DateTime.parse('2023-05-01'));
      final thirdItem = createListItemWithSpecifiedName('Third')
          .copyWith(datetime: DateTime.parse('2023-05-20'));
      final fourthItem = createListItemWithSpecifiedName('Fourth');

      final input = [firstItem, secondItem, thirdItem, fourthItem];
      final filters = Filters(
        endDate: DateTime.parse('2023-05-20'),
        regularCategoryFilters: {},
      );
      final actual = Filtering.filterListItems(
        allItems: input,
        filters: filters,
        listHasDates: true,
        listHasMap: false,
        distanceFilterCenter: null,
      );
      expect(actual, equals([secondItem, thirdItem, fourthItem]));
    });

    test(
        "return the item when the items date is between the filter's start date and end date",
        () {
      final firstItem = createListItemWithSpecifiedName('First')
          .copyWith(datetime: DateTime.parse('2023-05-21'));
      final secondItem = createListItemWithSpecifiedName('Second')
          .copyWith(datetime: DateTime.parse('2023-05-19'));
      final thirdItem = createListItemWithSpecifiedName('Third')
          .copyWith(datetime: DateTime.parse('2023-05-20'));
      final fourthItem = createListItemWithSpecifiedName('Third')
          .copyWith(datetime: DateTime.parse('2023-05-22'));
      final fifthItem = createListItemWithSpecifiedName('Third')
          .copyWith(datetime: DateTime.parse('2023-05-23'));
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
        regularCategoryFilters: {},
      );
      final actual = Filtering.filterListItems(
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

      LoggerHelper.logger
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
      final firstItem = createListItemWithSpecifiedName('First')
          .copyWith(latLong: const LatLong(lat: 0.001, lng: 0));
      final secondItem = createListItemWithSpecifiedName('Second')
          .copyWith(latLong: const LatLong(lat: 0.002, lng: 0));
      final thirdItem = createListItemWithSpecifiedName('Third');

      final input = [firstItem, secondItem, thirdItem];
      final filters = Filters(
        regularCategoryFilters: {},
        distance: 150,
      );
      expect(
        Filtering.filterListItems(
          allItems: input,
          filters: filters,
          listHasMap: true,
          listHasDates: false,
          distanceFilterCenter: const LatLong(lat: 0, lng: 0),
        ),
        equals([firstItem, thirdItem]),
      );
    });

    test('return the item when one date category is within boundries', () {
      final firstItem = createListItemWithSpecifiedName('First').copyWith(
        categories: {
          'date': ['2025-12-24'],
        },
      );
      final secondItem = createListItemWithSpecifiedName('Second').copyWith(
        categories: {
          'date': ['2026-12-24'],
        },
      );
      final thirdItem = createListItemWithSpecifiedName('Third');

      final input = [firstItem, secondItem, thirdItem];

      final lowerDateMs = DateTime.parse('2025-01-01').millisecondsSinceEpoch;
      final upperDateMs = DateTime.parse('2025-12-31').millisecondsSinceEpoch;
      final filters = Filters(
        dateCategoryFilters: {
          'date': (
            lowerDateMs,
            upperDateMs,
          ),
        },
        distance: 10000,
        regularCategoryFilters: {},
      );
      expect(
        Filtering.filterListItems(
          allItems: input,
          filters: filters,
          listHasMap: true,
          listHasDates: false,
          distanceFilterCenter: const LatLong(lat: 0, lng: 0),
        ).map((e) => e.name),
        equals([firstItem, thirdItem].map((e) => e.name)),
      );
    });

    test(
        'return the item when one of multiple date categories is within boundries',
        () {
      final firstItem = createListItemWithSpecifiedName('First').copyWith(
        categories: {
          'date': ['2025-11-05', '2025-12-05'],
        },
      );
      final secondItem = createListItemWithSpecifiedName('Second').copyWith(
        categories: {
          'date': ['2025-11-05', '2026-01-05'],
        },
      );
      final thirdItem = createListItemWithSpecifiedName('Third');

      final input = [firstItem, secondItem, thirdItem];
      final filters = Filters(
        dateCategoryFilters: {
          'date': (
            DateTime.parse('2025-12-01').millisecondsSinceEpoch,
            DateTime.parse('2025-12-31').millisecondsSinceEpoch,
          ),
        },
        distance: 10000,
        regularCategoryFilters: {},
      );
      expect(
        Filtering.filterListItems(
          allItems: input,
          filters: filters,
          listHasMap: true,
          listHasDates: false,
          distanceFilterCenter: const LatLong(lat: 0, lng: 0),
        ).map((e) => e.name),
        equals([firstItem, thirdItem].map((e) => e.name)),
      );
    });

    test('return the item when one time of day category is within boundries',
        () {
      final firstItem = createListItemWithSpecifiedName('First').copyWith(
        categories: {
          'timeOfDay': ['11:00'],
        },
      );
      final secondItem = createListItemWithSpecifiedName('Second').copyWith(
        categories: {
          'timeOfDay': ['09:00'],
        },
      );
      final thirdItem = createListItemWithSpecifiedName('Third');

      final input = [firstItem, secondItem, thirdItem];

      final lowerDateMs = DateHelper.timeOfDayToSeconds('10:00');
      final upperDateMs = DateHelper.timeOfDayToSeconds('12:00');
      final filters = Filters(
        timeOfDayCategoryFilters: {
          'timeOfDay': (
            lowerDateMs,
            upperDateMs,
          ),
        },
        distance: 10000,
        regularCategoryFilters: {},
      );
      expect(
        Filtering.filterListItems(
          allItems: input,
          filters: filters,
          listHasMap: true,
          listHasDates: false,
          distanceFilterCenter: const LatLong(lat: 0, lng: 0),
        ).map((e) => e.name),
        equals([firstItem, thirdItem].map((e) => e.name)),
      );
    });

    test(
        'return the item when one of multiple time of day categories is within boundries',
        () {
      final firstItem = createListItemWithSpecifiedName('First').copyWith(
        categories: {
          'timeOfDay': ['11:00', '19:00'],
        },
      );
      final secondItem = createListItemWithSpecifiedName('Second').copyWith(
        categories: {
          'timeOfDay': ['09:00', '21:00'],
        },
      );
      final thirdItem = createListItemWithSpecifiedName('Third');

      final input = [firstItem, secondItem, thirdItem];

      final lowerDateMs = DateHelper.timeOfDayToSeconds('10:00');
      final upperDateMs = DateHelper.timeOfDayToSeconds('12:00');
      final filters = Filters(
        timeOfDayCategoryFilters: {
          'timeOfDay': (
            lowerDateMs,
            upperDateMs,
          ),
        },
        distance: 10000,
        regularCategoryFilters: {},
      );
      expect(
        Filtering.filterListItems(
          allItems: input,
          filters: filters,
          listHasMap: true,
          listHasDates: false,
          distanceFilterCenter: const LatLong(lat: 0, lng: 0),
        ).map((e) => e.name),
        equals([firstItem, thirdItem].map((e) => e.name)),
      );
    });

    test('return the item when one numeric category is within boundries', () {
      final firstItem = createListItemWithSpecifiedName('First').copyWith(
        categories: {
          'numeric': ['11'],
        },
      );
      final secondItem = createListItemWithSpecifiedName('Second').copyWith(
        categories: {
          'numeric': ['9'],
        },
      );
      final thirdItem = createListItemWithSpecifiedName('Third');

      final input = [firstItem, secondItem, thirdItem];

      final filters = Filters(
        numericCategoryFilters: {
          'numeric': (
            10,
            12,
          ),
        },
        distance: 10000,
        regularCategoryFilters: {},
      );
      expect(
        Filtering.filterListItems(
          allItems: input,
          filters: filters,
          listHasMap: true,
          listHasDates: false,
          distanceFilterCenter: const LatLong(lat: 0, lng: 0),
        ).map((e) => e.name),
        equals([firstItem, thirdItem].map((e) => e.name)),
      );
    });

    test(
        'return the item when one of multiple time of day categories is within boundries',
        () {
      final firstItem = createListItemWithSpecifiedName('First').copyWith(
        categories: {
          'numeric': ['11', '19'],
        },
      );
      final secondItem = createListItemWithSpecifiedName('Second').copyWith(
        categories: {
          'numeric': ['9', '21'],
        },
      );
      final thirdItem = createListItemWithSpecifiedName('Third');

      final input = [firstItem, secondItem, thirdItem];

      final filters = Filters(
        numericCategoryFilters: {
          'numeric': (
            10,
            12,
          ),
        },
        distance: 10000,
        regularCategoryFilters: {},
      );
      expect(
        Filtering.filterListItems(
          allItems: input,
          filters: filters,
          listHasMap: true,
          listHasDates: false,
          distanceFilterCenter: const LatLong(lat: 0, lng: 0),
        ).map((e) => e.name),
        equals([firstItem, thirdItem].map((e) => e.name)),
      );
    });

    test('return the item when item name is partially matching with any case',
        () {
      final firstItem = createListItemWithSpecifiedName('First item');
      final secondItem = createListItemWithSpecifiedName('Second Item');
      final thirdItem = createListItemWithSpecifiedName('Third');

      final input = [firstItem, secondItem, thirdItem];

      final filters = Filters(
        itemName: 'Item',
        distance: 10000,
        regularCategoryFilters: {},
      );
      expect(
        Filtering.filterListItems(
          allItems: input,
          filters: filters,
          listHasMap: true,
          listHasDates: false,
          distanceFilterCenter: const LatLong(lat: 0, lng: 0),
        ).map((e) => e.name),
        equals([firstItem, secondItem].map((e) => e.name)),
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
        regularCategoryFilters: <String, Set<String>>{
          'type': {'B'},
        },
      );
      expect(
        Filtering.filterListItems(
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
          (e) => e.key == categoryName
              ? MapEntry(e.key, e.value)
              : MapEntry(e.key, [...e.value, categoryValue]),
        ),
      ),
    );
  }
  return item.copyWith(categories: {...item.categories, ...m1});
}
