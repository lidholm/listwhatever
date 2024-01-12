import 'package:flutter/material.dart';

import '../list_item.dart';

@immutable
sealed class ListItemState {}

class ListItemInitial extends ListItemState {}

class ListItemLoading extends ListItemState {}

class ListItemLoaded extends ListItemState {
  ListItemLoaded(this.listItem);
  final ListItem? listItem;
}

class ListItemError extends ListItemState {
  ListItemError(this.errorMessage);
  final String errorMessage;
}
