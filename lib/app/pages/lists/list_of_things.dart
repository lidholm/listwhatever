// ignore_for_file: invalid_annotation_target, always_put_required_named_parameters_first

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listanything/app/helpers/constants.dart';

part 'list_of_things.freezed.dart';
part 'list_of_things.g.dart';

typedef UserId = String;

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
    required String userId,
    @Default(false) bool withMap,
    @Default(false) bool withDates,
    @Default(false) bool withTimes,
    @Default(null)
    @JsonKey(fromJson: _fromJsonPublicListId, toJson: _toJsonPublicListId)
        String? publicListId,
    @Default(null) String? shareCodeForViewer,
    @Default(null) String? shareCodeForEditor,
    @Default(<UserId, bool>{}) Map<UserId, bool> viewers,
    @Default(<UserId, bool>{}) Map<UserId, bool> editors,
    @Default(false) bool shared,
    @Default(false) bool isViewer,
    @Default(false) bool isEditor,
  }) = _ListOfThings;

  factory ListOfThings.fromJson(Map<String, dynamic> json) =>
      _$ListOfThingsFromJson(json);
}

String _toJsonPublicListId(String? publicListId) {
  if (publicListId == null) {
    return getRandomString(6);
  }
  return publicListId;
}

String? _fromJsonPublicListId(String publicListId) {
  return publicListId;
}
