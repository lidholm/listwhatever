import 'package:flutter/material.dart';
import 'package:listanything/custom/firestore/lists/lists.dart';

@immutable
sealed class ListEvent {}

class ChangeUserForList extends ListEvent {
  ChangeUserForList(this.userId);

  final String? userId;
}

class LoadList extends ListEvent {
  LoadList(this.listId);
  final String listId;
}

class UpdateList extends ListEvent {
  UpdateList(this.list);

  final ListOfThings list;
}

class DeleteList extends ListEvent {
  DeleteList(this.listId);
  final String listId;
}
