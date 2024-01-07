import 'package:freezed_annotation/freezed_annotation.dart';

import 'list_type.dart';

part 'list_of_things.freezed.dart';
part 'list_of_things.g.dart';

enum ShareType {
  viewer, editor,
}

@freezed
class ListOfThings with _$ListOfThings {
  const factory ListOfThings({
    required String? id,
    required String name,
    required ListType listType,
    required bool withMap,
    required bool withDates,
    required bool withTimes,
    required bool shared,
    required String? shareCodeForViewer,
    required String? shareCodeForEditor,
    required Map<String, ShareType> sharedWith,
    required String? ownerId,
    @Default(false) bool isOwnList,
    @Default(ShareType.viewer) ShareType shareType,
  }) = _ListOfThings;

  factory ListOfThings.fromJson(Map<String, Object?> json)
  => _$ListOfThingsFromJson(json);
}
