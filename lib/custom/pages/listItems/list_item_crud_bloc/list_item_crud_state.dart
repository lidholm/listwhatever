import 'package:flutter/material.dart';
import 'package:listwhatever/custom/pages/listItems/list_item.dart';

@immutable
sealed class ListItemCrudState {}

class ListItemCrudInitial extends ListItemCrudState {}

class ListItemCrudLoading extends ListItemCrudState {}

class ListItemCrudChangedUser extends ListItemCrudState {
  ListItemCrudChangedUser(this.userId);
  final String userId;
}

class ListItemCrudAdded extends ListItemCrudState {
  ListItemCrudAdded(this.listItem);
  final ListItem listItem;
}

class ListItemCrudUpdated extends ListItemCrudState {
  ListItemCrudUpdated(this.listItem);
  final ListItem listItem;
}

class ListItemCrudDeleted extends ListItemCrudState {
  ListItemCrudDeleted(this.listItemId);
  final String listItemId;
}

class ListItemCrudImported extends ListItemCrudState {
  ListItemCrudImported(this.listItems);
  final List<ListItem> listItems;
}

class ListItemCrudError extends ListItemCrudState {
  ListItemCrudError(this.errorMessage);
  final String errorMessage;
}
