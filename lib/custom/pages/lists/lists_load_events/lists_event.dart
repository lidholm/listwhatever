import 'package:flutter/material.dart';

@immutable
abstract class ListsLoadEvent {}

class ChangeUserForListsLoad extends ListsLoadEvent {
  ChangeUserForListsLoad(this.userId);

  final String? userId;
}

class WatchLists extends ListsLoadEvent {
  WatchLists();
}
