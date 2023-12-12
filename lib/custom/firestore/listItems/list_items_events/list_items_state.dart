import 'package:flutter/material.dart';

import '../list_item.dart';

@immutable
sealed class ListItemsState {}

class ListItemsInitial extends ListItemsState {}

class ListItemsLoading extends ListItemsState {}

class ListItemsLoaded extends ListItemsState {
  ListItemsLoaded(this.listItems);
  final List<ListItem> listItems;
}

class ListItemsOperationSuccess extends ListItemsState {
  ListItemsOperationSuccess(this.message);
  final String message;
}

class ListItemsError extends ListItemsState {
  ListItemsError(this.errorMessage);
  final String errorMessage;
}
