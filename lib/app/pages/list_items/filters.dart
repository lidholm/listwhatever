import 'package:freezed_annotation/freezed_annotation.dart';

part 'filters.freezed.dart';

@freezed
class Filters with _$Filters {
  factory Filters({
    required Map<String, List<String>> categoryFilters,
    double? distance,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Filters;
  // Added constructor. Must not have any parameter
  const Filters._();

  bool anySelectedFilters({
    required bool listHasDates,
    required bool listHasMap,
  }) {
    if (categoryFilters.entries.any((element) => element.value.isNotEmpty)) {
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
