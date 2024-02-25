import 'package:flutter/material.dart';
import '/custom/pages/lists/models/list_of_things.dart';

@immutable
sealed class ListLoadState {}

class ListLoadInitial extends ListLoadState {}

class ListLoadLoading extends ListLoadState {}

class ListLoadLoaded extends ListLoadState {
  ListLoadLoaded(this.list);
  final ListOfThings? list;
}

class ListLoadError extends ListLoadState {
  ListLoadError(this.errorMessage);
  final String errorMessage;
}
