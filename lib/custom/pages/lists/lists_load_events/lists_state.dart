import 'package:flutter/material.dart';
import 'package:listwhatever/custom/pages/lists/models/user_list.dart';

@immutable
sealed class ListsLoadState {}

class ListsLoadInitial extends ListsLoadState {}

class ListsLoadLoading extends ListsLoadState {}

class ListsLoadLoaded extends ListsLoadState {
  ListsLoadLoaded(this.lists);
  final List<UserList> lists;
}

class ListsLoadError extends ListsLoadState {
  ListsLoadError(this.errorMessage);
  final String errorMessage;
}
