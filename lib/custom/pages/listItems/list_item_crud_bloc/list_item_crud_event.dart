import 'package:flutter/material.dart';
import '/custom/pages/listItems/models/list_item.dart';

@immutable
abstract class ListItemCrudEvent {}

class ChangeUserForListItemCrud extends ListItemCrudEvent {
  ChangeUserForListItemCrud(this.userId);

  final String? userId;
}

class AddListItem extends ListItemCrudEvent {
  AddListItem(this.actualListId, this.listItem);
  final String actualListId;
  final ListItem listItem;
}

class UpdateListItem extends ListItemCrudEvent {
  UpdateListItem(this.actualListId, this.listItem);
  final String actualListId;
  final ListItem listItem;
}

class DeleteListItem extends ListItemCrudEvent {
  DeleteListItem(this.actualListId, this.listItemId);
  final String actualListId;
  final String listItemId;
}

class ImportListItems extends ListItemCrudEvent {
  ImportListItems(this.actualListId, this.listItems);
  final String actualListId;
  final List<ListItem> listItems;
}
