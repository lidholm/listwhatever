import 'package:flutter/material.dart';
import '/custom/pages/shareList/shared_list.dart';

@immutable
sealed class SharedListState {}

class SharedListInitial extends SharedListState {}

class SharedListLoading extends SharedListState {}

class SharedListLoaded extends SharedListState {
  SharedListLoaded(this.sharedList);
  final SharedList sharedList;
}

class SharedListOperationSuccess extends SharedListState {
  SharedListOperationSuccess(this.message);
  final String message;
}

class SharedListError extends SharedListState {
  SharedListError(this.errorMessage);
  final String errorMessage;
}
