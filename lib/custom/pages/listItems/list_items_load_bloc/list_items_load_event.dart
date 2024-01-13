import 'package:flutter/material.dart';

@immutable
abstract class ListItemsLoadEvent {}

class ChangeUserForListItemsLoad extends ListItemsLoadEvent {
  ChangeUserForListItemsLoad(this.userId);
  final String? userId;
}

class LoadListItems extends ListItemsLoadEvent {
  LoadListItems(this.listId);
  final String listId;
}

class WatchListItems extends ListItemsLoadEvent {
  WatchListItems(this.listId);
  final String listId;
}
