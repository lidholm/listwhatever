// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_list_id.freezed.dart';
part 'public_list_id.g.dart';

@freezed
class PublicListId with _$PublicListId {
  const factory PublicListId({
    required String path,
    required String publicListId,
    required Map<String, bool> editors,
    required Map<String, bool> viewers,
    required String userId,
    required String listId,
  }) = _PublicListId;

  factory PublicListId.fromJson(Map<String, dynamic> json) => _$PublicListIdFromJson(json);
}
