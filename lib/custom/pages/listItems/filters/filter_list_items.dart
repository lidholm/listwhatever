import 'package:great_circle_distance_calculator/great_circle_distance_calculator.dart';
import 'package:listwhatever/custom/pages/listItems/filters/categories_helper.dart';
import '/custom/pages/listItems/models/list_item.dart';

import '/custom/pages/listItems/searchLocation/geocoder/latlong.dart';
import '/standard/constants.dart';
import 'filters.dart';

const String className = 'filterListItems';

List<ListItem> filterListItems({
  required List<ListItem> allItems,
  required Filters filters,
  required bool listHasDates,
  required bool listHasMap,
  required LatLong? distanceFilterCenter,
}) {
  final filteredItems = <ListItem>[];
  for (final item in allItems) {
    if (matchesFilter(
      item: item,
      filters: filters,
      listHasDates: listHasDates,
      listHasMap: listHasMap,
      distanceFilterCenter: distanceFilterCenter,
    )) {
      filteredItems.add(item);
    }
  }
  // logger.d('number of filteredItems: ${filteredItems.length}');
  return filteredItems;
}

bool matchesFilter({
  required ListItem item,
  required Filters filters,
  required bool listHasDates,
  required bool listHasMap,
  required LatLong? distanceFilterCenter,
}) {
  final matchesDate = matchesDatesFilter(
    item: item,
    filters: filters,
    listHasDates: listHasDates,
  );
  final matchesCategories = matchesCategoriesFilter(item, filters);
  final matchesDistance = matchesDistanceFilter(
    listHasMap: listHasMap,
    distanceFilterCenter: distanceFilterCenter,
    item: item,
    filters: filters,
  );
  final matchesItemName = matchesItemNameFilter(item, filters);

  final matches =
      matchesDate && matchesCategories && matchesDistance && matchesItemName;
  // logger
  //   ..d('distanceFilterCenter: $distanceFilterCenter')
  //   ..d('filters.distance: ${filters.distance}')
  //   ..d('matchesDate: $matchesDate')
  //   ..d('matchesCategories: $matchesCategories')
  //   ..d('matchesDistance: $matchesDistance');
  // logger.d(
  //   '$className: ${item.name} ($matchesDate, $matchesCategories, $matchesDistance) => $matches',
  // );
  return matches;
}

bool matchesDatesFilter({
  required ListItem item,
  required Filters filters,
  required bool listHasDates,
}) {
  if (filters.startDate == null && filters.endDate == null) {
    // logger.d('no filters, so a match');
    return true;
  }
  if (!listHasDates) {
    // logger.d("List doesn't have dates, so a match");
    return true;
  }
  if (item.datetime == null) {
    return true;
  }
  final response =
      item.datetime!.compareTo(filters.startDate ?? minDateTime) >= 0 &&
          item.datetime!.compareTo(filters.endDate ?? maxDateTime) <= 0;
  if (!response) {
    // logger.d('not matching date filter');
  }
  return response;
}

bool matchesCategoriesFilter(ListItem item, Filters filters) {
  return matchesRegularCategoriesFilter(item, filters) &&
      matchesDateCategoriesFilter(item, filters) &&
      matchesTimeOfDayCategoriesFilter(item, filters) &&
      matchesNumericCategoriesFilter(item, filters);
}

bool matchesRegularCategoriesFilter(ListItem item, Filters filters) {
  /* An item will match the filters if for each category in the item,
    there either isn't a filter for it, or one of the values for that
    category matches with one of the values for in the filter for that category
    E.g. an item can have two category values for 'food nationalty'; 'italian' and 'pizza'
    and the filter can say, give me either 'italian' food or 'meditarrean' food
    */
  if (filters.regularCategoryFilters == null ||
      filters.regularCategoryFilters!.values.expand((e) => e).isEmpty) {
    // logger.d('no filters, so a match');
    return true;
  }
  if (filters.regularCategoryFilters!.values.expand((e) => e).isNotEmpty &&
      item.categories.isEmpty) {
    logger.d("filters but no categories, so can't be a match");
    return false;
  }
  // items without a date set will match even if a start or end date has been set

  for (final categoryName in filters.regularCategoryFilters!.keys) {
    final acceptedFilterValues = getFilterValuesForCategory(
          filters.regularCategoryFilters!,
          categoryName,
        ) ??
        {};
    final valuesForCategory = item.categories.entries
        .where((c) => c.key == categoryName)
        .expand((c) => c.value)
        .toList();
    var matches = false;
    if (valuesForCategory.isEmpty) {
      matches = true;
    }
    for (final afv in acceptedFilterValues) {
      if (valuesForCategory.contains(afv)) {
        matches = true;
      }
    }
    if (!matches) {
      logger.d('not matching categories');
      return false;
    }
  }
  return true;
}

bool matchesDateCategoriesFilter(ListItem item, Filters filters) {
  final categoriesWithDates =
      filters.dateCategoryFilters?.entries.map((e) => e.key).toList();
  if (categoriesWithDates == null || categoriesWithDates.isEmpty) {
    return true;
  }

  final dateCategories = item.categories.entries
      .where((e) => categoriesWithDates.contains(e.key))
      .map((e) => (e.key, e.value.map(DateTime.parse).toList()))
      .toList();

  for (final entry in dateCategories) {
    final boundries = filters.dateCategoryFilters![entry.$1];
    final boundryDates = (
      DateTime.fromMillisecondsSinceEpoch(boundries!.$1),
      DateTime.fromMillisecondsSinceEpoch(boundries.$2)
    );
    for (final date in entry.$2) {
      if (date.compareTo(boundryDates.$1) >= 0 &&
          date.compareTo(boundryDates.$2) <= 0) {
        return true;
      }
    }
    return false;
  }
  return true;
}

bool matchesTimeOfDayCategoriesFilter(ListItem item, Filters filters) {
  final categoriesWithTimeOfDay =
      filters.timeOfDayCategoryFilters?.entries.map((e) => e.key).toList();
  if (categoriesWithTimeOfDay == null || categoriesWithTimeOfDay.isEmpty) {
    return true;
  }

  final timeOfDayCategories = item.categories.entries
      .where((e) => categoriesWithTimeOfDay.contains(e.key))
      .map((e) => (e.key, e.value.map(timeOfDayToSeconds).toList()))
      .toList();

  for (final entry in timeOfDayCategories) {
    final boundryTimeOfDays = filters.timeOfDayCategoryFilters![entry.$1]!;
    for (final timeOfDay in entry.$2) {
      if (timeOfDay >= boundryTimeOfDays.$1 &&
          timeOfDay <= boundryTimeOfDays.$2) {
        return true;
      }
    }
    return false;
  }
  return true;
}

bool matchesNumericCategoriesFilter(ListItem item, Filters filters) {
  final categoriesWithNumeric =
      filters.numericCategoryFilters?.entries.map((e) => e.key).toList();

  if (categoriesWithNumeric == null || categoriesWithNumeric.isEmpty) {
    return true;
  }

  final numericCategories = item.categories.entries
      .where((e) => categoriesWithNumeric.contains(e.key))
      .map((e) => (e.key, e.value))
      .toList();

  for (final entry in numericCategories) {
    final boundryTimeOfDays = filters.numericCategoryFilters![entry.$1]!;
    for (final number in entry.$2.map(int.parse)) {
      if (number >= boundryTimeOfDays.$1 && number <= boundryTimeOfDays.$2) {
        return true;
      }
    }
    return false;
  }
  return true;
}

bool hasFilterForCategory(CategoryFilters filters, String categoryName) {
  return filters[categoryName] != null && filters[categoryName]!.isNotEmpty;
}

Set<String?>? getFilterValuesForCategory(
  CategoryFilters filters,
  String categoryName,
) {
  return filters[categoryName];
}

bool matchesDistanceFilter({
  required bool listHasMap,
  required LatLong? distanceFilterCenter,
  required ListItem item,
  required Filters filters,
}) {
  if (item.latLong == null ||
      filters.distance == null ||
      distanceFilterCenter == null) return true;

  final gcd = GreatCircleDistance.fromDegrees(
    latitude1: item.latLong!.lat,
    longitude1: item.latLong!.lng,
    latitude2: distanceFilterCenter.lat,
    longitude2: distanceFilterCenter.lng,
  );
  // logger.d('distance: ${gcd.haversineDistance()}');
  final response = gcd.haversineDistance() < filters.distance!;
  if (!response) {
    // logger.d('not matching distance filter');
  }
  return response;
}

bool matchesItemNameFilter(
  ListItem item,
  Filters filters,
) {
  if (filters.itemName == null || filters.itemName!.isEmpty) {
    return true;
  }
  final result =
      item.name.toLowerCase().contains(filters.itemName!.toLowerCase());
  print('result: $result');
  return result;
}
