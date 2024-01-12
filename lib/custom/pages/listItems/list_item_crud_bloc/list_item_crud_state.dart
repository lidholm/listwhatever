import 'package:flutter/material.dart';

@immutable
sealed class ListItemCrudState {}

class ListItemCrudInitial extends ListItemCrudState {}

class ListItemCrudLoading extends ListItemCrudState {}

class ListItemCrudOperationSuccess extends ListItemCrudState {
  ListItemCrudOperationSuccess(this.message);
  final String message;
}

class ListItemCrudError extends ListItemCrudState {
  ListItemCrudError(this.errorMessage);
  final String errorMessage;
}
