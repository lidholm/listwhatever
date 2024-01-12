import 'package:flutter/material.dart';
import '/custom/pages/listItems/list_item.dart';

@immutable
abstract class ListItemCrudEvent {}

class ChangeUserForListItemCrud extends ListItemCrudEvent {
  ChangeUserForListItemCrud(this.userId);

  final String? userId;
}

class AddListItem extends ListItemCrudEvent {
  AddListItem(this.listId, this.listItem);
  final String listId;
  final ListItem listItem;
}

class UpdateListItem extends ListItemCrudEvent {
  UpdateListItem(this.listId, this.listItem);
  final String listId;
  final ListItem listItem;
}

class DeleteListItem extends ListItemCrudEvent {
  DeleteListItem(this.listId, this.listItemId);
  final String listId;
  final String listItemId;
}

class ImportListItems extends ListItemCrudEvent {
  ImportListItems(this.listId, this.listItems);
  final String listId;
  final List<ListItem> listItems;
}
