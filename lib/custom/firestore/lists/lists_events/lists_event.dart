import 'package:flutter/material.dart';
import 'package:listanything/custom/firestore/lists/list_of_things.dart';

@immutable
abstract class ListsEvent {}

class ChangeUserForLists extends ListsEvent {
  ChangeUserForLists(this.userId);

  final String? userId;
}

class WatchLists extends ListsEvent {
  WatchLists();
}

class AddList extends ListsEvent {
  AddList(this.list);
  final ListOfThings list;
}
