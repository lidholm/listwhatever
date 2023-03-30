// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listanything/app/helpers/constants.dart';

part 'list_of_things.freezed.dart';
part 'list_of_things.g.dart';

enum ListType {
  restaurants,
  food,
  activities,
  movies,
  other,
}

@freezed
class ListOfThings with _$ListOfThings {
  const factory ListOfThings({
    String? id,
    required String name,
    required ListType type,
    @Default(false) bool withMap,
    @Default(false) bool withDates,
    @Default(false) bool withTimes,
    @Default(null) @JsonKey(fromJson: _fromJsonShareCode, toJson: _toJsonShareCode) String? shareCode,
  }) = _ListOfThings;

  factory ListOfThings.fromJson(Map<String, dynamic> json) => _$ListOfThingsFromJson(json);
}

String _toJsonShareCode(String? code) {
  if (code == null) {
    return getRandomString(6);
  }
  return code;
}

String? _fromJsonShareCode(String code) {
  return code;
}
