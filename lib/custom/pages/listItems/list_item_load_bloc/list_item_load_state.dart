import 'package:flutter/material.dart';
import '/custom/pages/listItems/models/list_item.dart';

@immutable
sealed class ListItemLoadState {}

class ListItemLoadInitial extends ListItemLoadState {}

class ListItemLoadLoading extends ListItemLoadState {}

class ListItemLoadLoaded extends ListItemLoadState {
  ListItemLoadLoaded(this.listItem);
  final ListItem? listItem;
}

class ListItemLoadError extends ListItemLoadState {
  ListItemLoadError(this.errorMessage);
  final String errorMessage;
}
