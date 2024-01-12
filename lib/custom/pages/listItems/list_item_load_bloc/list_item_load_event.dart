import 'package:flutter/material.dart';

@immutable
abstract class ListItemLoadEvent {}

class ChangeUserForListItemLoad extends ListItemLoadEvent {
  ChangeUserForListItemLoad(this.userId);

  final String? userId;
}

class LoadListItem extends ListItemLoadEvent {
  LoadListItem(this.listId, this.listItemId);
  final String listId;
  final String listItemId;
}
