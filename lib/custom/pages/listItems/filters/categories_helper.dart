import 'package:listwhatever/custom/pages/listItems/models/list_item.dart';

typedef CategoryFilters = Map<String, Set<String>>;

class CategoriesHelper {
  static CategoryFilters getAllCategoriesAndValues(List<ListItem> items) {
    final categoryFilters = <String, Set<String>>{};

    for (final item in items) {
      for (final value in item.categories.entries) {
        final categoryName = value.key;
        if (!categoryFilters.containsKey(categoryName)) {
          categoryFilters[categoryName] = {};
        }
        // getCategoryName(value.key)
        categoryFilters[categoryName]!
            .addAll((value.value as List<String>?) ?? []);
      }
    }
    return categoryFilters;
  }

  static CategoryFilters getAllCategoriesAndValuesForListOfCategories(
    Iterable<MapEntry<String, List<String>>> entries,
  ) {
    final categoryFilters = <String, Set<String>>{};

    for (final value in entries) {
      final categoryName = value.key;
      if (!categoryFilters.containsKey(categoryName)) {
        categoryFilters[categoryName] = {};
      }
      // getCategoryName(value.key)
      final maybeValuesList = value.value as List<String>?;
      final valuesList = maybeValuesList ?? [];
      final values = valuesList.toSet();
      categoryFilters[categoryName]!.addAll(values);
    }

    return categoryFilters;
  }

  static String getCategoryName(String categoryFieldKey) {
    return categoryFieldKey.substring(
      categoryFieldKey.indexOf('-') + 1,
      categoryFieldKey.lastIndexOf('-'),
    );
  }

  static Iterable<MapEntry<String, dynamic>> combineCategoryValues(
    Iterable<MapEntry<String, List<String>>> element,
  ) {
    return [];
  }
}
