import 'package:flutter_test/flutter_test.dart';
import 'package:listanything/app/pages/list_items/filters.dart';

void main() {
  final emptyFilters = Filters(
    categoryFilters: <String, List<String>>{},
  );
  group('filters anySelectedFilters', () {
    test('returns "false" when no filters are set', () {
      expect(emptyFilters.anySelectedFilters(listHasDates: true), false);
    });

    test('returns "true" when some category filters are set', () {
      final filters = Filters(
        categoryFilters: <String, List<String>>{
          'name': ['one', 'tow']
        },
      );
      expect(filters.anySelectedFilters(listHasDates: true), true);
    });

    test('returns "true" when start date is set', () {
      final filters = Filters(
        categoryFilters: <String, List<String>>{},
        startDate: DateTime.now(),
      );
      expect(filters.anySelectedFilters(listHasDates: true), true);
    });

    test('returns "true" when end date is set', () {
      final filters = Filters(
        categoryFilters: <String, List<String>>{},
        endDate: DateTime.now(),
      );
      expect(filters.anySelectedFilters(listHasDates: true), true);
    });

    test('returns "false" when start date is set, but list doesn\'t have dates', () {
      final filters = Filters(
        categoryFilters: <String, List<String>>{},
        startDate: DateTime.now(),
      );
      expect(filters.anySelectedFilters(listHasDates: false), false);
    });
  });
}
