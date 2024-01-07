import 'package:great_circle_distance_calculator/great_circle_distance_calculator.dart';

import '/custom/pages/listItems/searchLocation/geocoder/latlong.dart';
import '/standard/constants.dart';
import '../list_item.dart';
import 'filters.dart';

typedef CategoryFilters = Map<String, List<String>>;

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
  return matchesDatesFilter(
    item: item,
    filters: filters,
    listHasDates: listHasDates,
  ) &&
      matchesCategoriesFilter(item, filters) &&
      matchesDistanceFilter(
        listHasMap: listHasMap,
        distanceFilterCenter: distanceFilterCenter,
        item: item,
        filters: filters,
      );
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
  final response = item.datetime!.compareTo(filters.startDate ?? minDateTime) >= 0 &&
      item.datetime!.compareTo(filters.endDate ?? maxDateTime) <= 0;
  if (!response) {
    // logger.d('not matching date filter');
  }
  return response;
}

bool matchesCategoriesFilter(ListItem item, Filters filters) {
  /* An item will match the filters if for each category in the item,
    there either isn't a filter for it, or one of the values for that
    category matches with one of the values for in the filter for that category
    E.g. an item can have two category values for 'food nationalty'; 'italian' and 'pizza'
    and the filter can say, give me either 'italian' food or 'meditarrean' food
    */
  if (filters.categoryFilters.values.expand((e) => e).isEmpty) {
    // logger.d('no filters, so a match');
    return true;
  }
  if (filters.categoryFilters.values.expand((e) => e).isNotEmpty &&
      item.categories.isEmpty) {
    // logger.d("filters but no categories, so can't be a match");
    return false;
  }
  // items without a date set will match even if a start or end date has been set

  for (final categoryName in filters.categoryFilters.keys) {
    final acceptedFilterValues =
        getFilterValuesForCategory(filters.categoryFilters, categoryName) ?? [];
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
    if (filters.startDate != null) {
      if (item.datetime != null &&
          item.datetime!.compareTo(filters.startDate!) < 0) {
        matches = false;
      }
    }
    if (!matches) {
      // logger.d('not matching categories');
      return false;
    }
  }
  return true;
}

bool hasFilterForCategory(CategoryFilters filters, String categoryName) {
  return filters[categoryName] != null && filters[categoryName]!.isNotEmpty;
}

List<String?>? getFilterValuesForCategory(
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
