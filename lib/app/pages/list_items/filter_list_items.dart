import 'package:listanything/app/pages/list_items/list_item.dart';

typedef Filters = Map<String, List<String?>>;

List<ListItem> filterListItems(List<ListItem> allItems, Filters filters) {
  final filteredItems = <ListItem>[];
  for (final item in allItems) {
    if (matchesFilter(item, filters)) {
      filteredItems.add(item);
    }
  }
  return filteredItems;
}

bool matchesFilter(ListItem item, Filters filters) {
  /* An item will match the filters if for each category in the item, 
    there either isn't a filter for it, or one of the values for that 
    category matches with one of the values for in the filter for that category
    E.g. an item can have two category values for 'food nationalty'; 'italian' and 'pizza'
    and the filter can say, give me either 'italian' food or 'meditarrean' food
    */
  if (filters.values.expand((e) => e).isEmpty) {
    print('no filters, so a match');
    return true;
  }
  if (item.categories.isEmpty) {
    print("filters but no categories, so can't be a match");
    return false;
  }
  for (final categoryName in filters.keys) {
    // if (!hasFilterForCategory(filters, categoryName)) {
    //   return false;
    // }
    final acceptedFilterValues = getFilterValuesForCategory(filters, categoryName) ?? [];
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
    if (!matches) {
      return false;
    }
  }
  return true;
}

bool hasFilterForCategory(Filters filters, String categoryName) {
  return filters[categoryName] != null && filters[categoryName]!.isNotEmpty;
}

List<String?>? getFilterValuesForCategory(Filters filters, String categoryName) {
  return filters[categoryName];
}
