import 'package:freezed_annotation/freezed_annotation.dart';
import '/custom/pages/lists/models/list_type.dart';

part 'list_of_things.freezed.dart';
part 'list_of_things.g.dart';

enum ShareType {
  viewer,
  editor,
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
    required Map<String, ShareType> sharedWith,
    required String? ownerId,
    @Default(null) String? imageFilename,
    @Default(null) String? shareCodeForViewer,
    @Default(null) String? shareCodeForEditor,
    @Default(ShareType.viewer) ShareType shareType,
  }) = _ListOfThings;

  factory ListOfThings.fromJson(Map<String, Object?> json) =>
      _$ListOfThingsFromJson(json);
}
