import 'package:freezed_annotation/freezed_annotation.dart';

import 'list_type.dart';

part 'list_of_things.freezed.dart';
part 'list_of_things.g.dart';

@freezed
class ListOfThings with _$ListOfThings {
  const factory ListOfThings({
    required String? id,
    required String name,
    required ListType type,
    required bool withMap,
    required bool withDates,
    required bool withTimes,
    required bool shared,
  }) = _ListOfThings;

  factory ListOfThings.fromJson(Map<String, Object?> json)
  => _$ListOfThingsFromJson(json);
}
