import 'package:flutter/material.dart';
import 'package:allmylists/custom/firestore/sharedList/shared_list.dart';

@immutable
sealed class SubscribeListState {}

class SubscribeListInitial extends SubscribeListState {}

class SubscribeListLoading extends SubscribeListState {}

class SubscribeListLoaded extends SubscribeListState {
  SubscribeListLoaded(this.sharedList);
  final SharedList sharedList;
}

class SubscribeListOperationSuccess extends SubscribeListState {
  SubscribeListOperationSuccess(this.message);
  final String message;
}

class SubscribeListError extends SubscribeListState {
  SubscribeListError(this.errorMessage);
  final String errorMessage;
}
