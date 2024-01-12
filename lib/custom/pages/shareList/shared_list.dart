import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listwhatever/custom/pages/lists/models/list_of_things.dart';
import 'package:listwhatever/custom/pages/lists/models/list_type.dart';

part 'shared_list.freezed.dart';

@freezed
class SharedList with _$SharedList {
  const factory SharedList({
    required String? id,
    required String listName,
    required String ownerName,
    required String ownerUserId,
    required String ownerListId,
    required ShareType shareType,
    required ListType listType,
  }) = _SharedList;

  factory SharedList.fromJson(Map<String, Object?> json) => _$SharedListFromJson(json);
}
