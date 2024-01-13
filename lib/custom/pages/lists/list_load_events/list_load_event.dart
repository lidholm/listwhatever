import 'package:flutter/material.dart';

@immutable
sealed class ListLoadEvent {}

class ChangeUserForListLoad extends ListLoadEvent {
  ChangeUserForListLoad(this.userId);
  final String? userId;
}

class LoadList extends ListLoadEvent {
  LoadList(this.listId);
  final String listId;
}
