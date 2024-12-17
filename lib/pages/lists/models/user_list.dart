import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list.freezed.dart';
part 'user_list.g.dart';

@freezed
class UserList with _$UserList {
  const factory UserList({
    required String? id,
    required String listId,
    required String listName,
    required String? imageFilename,
    required String ownerId,
    required bool? isOwnList,
  }) = _UserList;

  factory UserList.fromJson(Map<String, Object?> json) =>
      _$UserListFromJson(json);
}
