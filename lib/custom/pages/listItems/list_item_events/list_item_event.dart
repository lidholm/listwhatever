import 'package:flutter/material.dart';
import '/custom/pages/listItems/list_item.dart';

@immutable
abstract class ListItemEvent {}

class ChangeUserForListItem extends ListItemEvent {
  ChangeUserForListItem(this.userId);

  final String? userId;
}

class LoadListItem extends ListItemEvent {
  LoadListItem(this.listId, this.listItemId);
  final String listId;
  final String listItemId;
}

class UpdateListItem extends ListItemEvent {
  UpdateListItem(this.listId, this.item);
  final String listId;

  final ListItem item;
}

class DeleteListItem extends ListItemEvent {
  DeleteListItem(this.listId, this.listItemId);
  final String listId;
  final String listItemId;
}

class ImportListItems extends ListItemEvent {
  ImportListItems(this.listId, this.listItems);
  final String listId;
  final List<ListItem> listItems;
}
