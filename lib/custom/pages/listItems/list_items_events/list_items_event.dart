import 'package:flutter/material.dart';
import '/custom/pages/listItems/list_item.dart';

@immutable
abstract class ListItemsEvent {}

class ChangeUserForListItems extends ListItemsEvent {
  ChangeUserForListItems(this.userId);

  final String? userId;
}

class LoadListItems extends ListItemsEvent {
  LoadListItems(this.listId);
  final String listId;
}

class WatchListItems extends ListItemsEvent {
  WatchListItems(this.listId);
  final String listId;
}

class AddListItem extends ListItemsEvent {
  AddListItem(this.listId, this.item);
  final String listId;
  final ListItem item;
}
