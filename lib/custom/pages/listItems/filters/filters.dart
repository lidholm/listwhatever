import 'package:freezed_annotation/freezed_annotation.dart';

part 'filters.freezed.dart';

@freezed
class Filters with _$Filters {
  factory Filters({
    @Default(null) String? itemName,
    @Default(null) double? distance,
    @Default(null) DateTime? startDate,
    @Default(null) DateTime? endDate,
    @Default(null) Map<String, Set<String>>? regularCategoryFilters,
    @Default(null) Map<String, (int, int)>? dateCategoryFilters,
    @Default(null) Map<String, (int, int)>? timeOfDayCategoryFilters,
    @Default(null) Map<String, (int, int)>? numericCategoryFilters,
  }) = _Filters;
  // Added constructor. Must not have any parameter
  const Filters._();

  bool anySelectedFilters({
    required bool listHasDates,
    required bool listHasMap,
  }) {
    if (regularCategoryFilters != null &&
        regularCategoryFilters!.entries
            .any((element) => element.value.isNotEmpty)) {
      return true;
    }
    if (dateCategoryFilters != null &&
        dateCategoryFilters!.entries.isNotEmpty) {
      return true;
    }
    if (timeOfDayCategoryFilters != null &&
        timeOfDayCategoryFilters!.entries.isNotEmpty) {
      return true;
    }
    if (listHasDates && startDate != null || endDate != null) {
      return true;
    }
    if (listHasMap && distance != null) {
      return true;
    }
    return false;
  }
}
