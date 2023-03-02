import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _ListOfThings;

  factory ListOfThings.fromJson(Map<String, dynamic> json) => _$ListOfThingsFromJson(json);
}
