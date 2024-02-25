import 'package:flutter/material.dart';
import '/custom/pages/lists/models/list_of_things.dart';

@immutable
sealed class ListCrudState {}

class ListCrudInitial extends ListCrudState {}

class ListCrudLoading extends ListCrudState {}

class ListCrudChangedUser extends ListCrudState {
  ListCrudChangedUser(this.userId);
  final String userId;
}

class ListCrudAdded extends ListCrudState {
  ListCrudAdded(this.list);
  final ListOfThings list;
}

class ListCrudUpdated extends ListCrudState {
  ListCrudUpdated(this.list);
  final ListOfThings list;
}

class ListCrudDeleted extends ListCrudState {
  ListCrudDeleted(this.listId);
  final String listId;
}

class ListCrudError extends ListCrudState {
  ListCrudError(this.errorMessage);
  final String errorMessage;
}
