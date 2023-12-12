import 'package:flutter/material.dart';
import 'package:listanything/custom/firestore/lists/list_of_things.dart';

@immutable
sealed class ListsState {}

class ListsInitial extends ListsState {}

class ListsLoading extends ListsState {}

class ListsLoaded extends ListsState {
  ListsLoaded(this.lists);
  final List<ListOfThings> lists;
}

class ListsOperationSuccess extends ListsState {
  ListsOperationSuccess(this.message);
  final String message;
}

class ListsError extends ListsState {
  ListsError(this.errorMessage);
  final String errorMessage;
}
