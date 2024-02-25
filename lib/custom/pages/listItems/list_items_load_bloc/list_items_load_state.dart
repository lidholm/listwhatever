import 'package:flutter/material.dart';
import '/custom/pages/listItems/models/list_item.dart';

@immutable
sealed class ListItemsLoadState {}

class ListItemsLoadInitial extends ListItemsLoadState {}

class ListItemsLoadLoading extends ListItemsLoadState {}

class ListItemsLoadLoaded extends ListItemsLoadState {
  ListItemsLoadLoaded(this.listItems);
  final List<ListItem> listItems;
}

class ListItemsLoadError extends ListItemsLoadState {
  ListItemsLoadError(this.errorMessage);
  final String errorMessage;
}
