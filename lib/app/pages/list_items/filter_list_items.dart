import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/pages/list_items/filters.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';

typedef CategoryFilters = Map<String, List<String>>;

List<ListItem> filterListItems({
  required List<ListItem> allItems,
  required Filters filters,
  required bool listHasDates,
}) {
  final filteredItems = <ListItem>[];
  for (final item in allItems) {
    if (matchesFilter(item: item, filters: filters, listHasDates: listHasDates)) {
      filteredItems.add(item);
    }
  }
  return filteredItems;
}

bool matchesFilter({required ListItem item, required Filters filters, required bool listHasDates}) {
  return matchesDatesFilter(item: item, filters: filters, listHasDates: listHasDates) &&
      matchesCategoriesFilter(item, filters);
}

bool matchesDatesFilter({required ListItem item, required Filters filters, required bool listHasDates}) {
  if (!listHasDates) {
    print("List doesn't have dates, so a match");
    return true;
  }
  if (filters.startDate == null && filters.endDate == null) {
    print('no filters, so a match');
    return true;
  }
  if (item.datetime == null) {
    return true;
  }
  return item.datetime!.compareTo(filters.startDate ?? minDateTime) >= 0 &&
      item.datetime!.compareTo(filters.endDate ?? maxDateTime) <= 0;
}

bool matchesCategoriesFilter(ListItem item, Filters filters) {
  /* An item will match the filters if for each category in the item, 
    there either isn't a filter for it, or one of the values for that 
    category matches with one of the values for in the filter for that category
    E.g. an item can have two category values for 'food nationalty'; 'italian' and 'pizza'
    and the filter can say, give me either 'italian' food or 'meditarrean' food
    */
  if (filters.categoryFilters.values.expand((e) => e).isEmpty) {
    print('no filters, so a match');
    return true;
  }
  if (filters.categoryFilters.values.expand((e) => e).isNotEmpty && item.categories.isEmpty) {
    print("filters but no categories, so can't be a match");
    return false;
  }
  // items without a date set will match even if a start or end date has been set

  for (final categoryName in filters.categoryFilters.keys) {
    final acceptedFilterValues = getFilterValuesForCategory(filters.categoryFilters, categoryName) ?? [];
    final valuesForCategory =
        item.categories.entries.where((c) => c.key == categoryName).expand((c) => c.value).toList();
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
      if (item.datetime != null && item.datetime!.compareTo(filters.startDate!) < 0) {
        matches = false;
      }
    }
    if (!matches) {
      return false;
    }
  }
  return true;
}

bool hasFilterForCategory(CategoryFilters filters, String categoryName) {
  return filters[categoryName] != null && filters[categoryName]!.isNotEmpty;
}

List<String?>? getFilterValuesForCategory(CategoryFilters filters, String categoryName) {
  return filters[categoryName];
}
