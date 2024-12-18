import 'package:flutter/material.dart';
import 'package:listwhatever/pages/lists/components/user_list_tile.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: UserListTile)
Widget userListTile(BuildContext context) {
  final list = UserList(
      id: '',
      listId: 'listId',
      listName: context.knobs.string(
        label: 'Title Label',
        initialValue: 'Restaurants',
      ),
      imageFilename: 'assets/images/restaurants.jpeg',
      ownerId: 'ownerId',
      isOwnList: true);
  return UserListTile(
    list: list,
    isLoading: false,
  );
}

@widgetbook.UseCase(name: 'With shimmer', type: UserListTile)
Widget userListTileWithShimmer(BuildContext context) {
  final list = UserList(
      id: '',
      listId: 'listId',
      listName: 'listName',
      imageFilename: 'imageFilename',
      ownerId: 'ownerId',
      isOwnList: true);
  return UserListTile(
    list: list,
    isLoading: true,
  );
}
