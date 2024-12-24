import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';

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

  factory UserList.fromList(ListOfThings list, String listId) => UserList(
        id: null,
        listId: listId,
        listName: list.name,
        ownerId: list.ownerId ?? 'Fix',
        isOwnList: true,
        imageFilename: '',
      );

  factory UserList.shimmerList() => const UserList(
        id: null,
        listId: '',
        listName: '',
        ownerId: '',
        isOwnList: true,
        imageFilename: '',
      );
}
