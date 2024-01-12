import 'package:flutter/material.dart';

@immutable
sealed class ListCrudState {}

class ListCrudInitial extends ListCrudState {}

class ListCrudLoading extends ListCrudState {}

class ListCrudOperationSuccess extends ListCrudState {
  ListCrudOperationSuccess(this.message);
  final String message;
}

class ListCrudError extends ListCrudState {
  ListCrudError(this.errorMessage);
  final String errorMessage;
}
