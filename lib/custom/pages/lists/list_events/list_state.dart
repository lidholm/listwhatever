import 'package:flutter/material.dart';
import 'package:listwhatever/custom/pages/lists/models/list_of_things.dart';

@immutable
sealed class ListState {}

class ListInitial extends ListState {}

class ListLoading extends ListState {}

class ListLoaded extends ListState {
  ListLoaded(this.list);
  final ListOfThings? list;
}

class ListOperationSuccess extends ListState {
  ListOperationSuccess(this.message);
  final String message;
}

class ListError extends ListState {
  ListError(this.errorMessage);
  final String errorMessage;
}

class ListDeleted extends ListState {
  ListDeleted(this.listId);
  final String listId;
}
