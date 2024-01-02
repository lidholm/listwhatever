import 'package:flutter/material.dart';
import '/custom/firestore/lists/user_list.dart';

@immutable
sealed class ListsState {}

class ListsInitial extends ListsState {}

class ListsLoading extends ListsState {}

class ListsLoaded extends ListsState {
  ListsLoaded(this.lists);
  final List<UserList> lists;
}

class ListsOperationSuccess extends ListsState {
  ListsOperationSuccess(this.message);
  final String message;
}

class ListsError extends ListsState {
  ListsError(this.errorMessage);
  final String errorMessage;
}
