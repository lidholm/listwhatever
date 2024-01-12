import 'package:flutter/material.dart';
import 'package:listwhatever/custom/pages/lists/models/list_of_things.dart';

@immutable
sealed class ListCrudEvent {}

class ChangeUserForListCrud extends ListCrudEvent {
  ChangeUserForListCrud(this.userId);
  final String? userId;
}

class AddList extends ListCrudEvent {
  AddList(this.list);
  final ListOfThings list;
}

class UpdateList extends ListCrudEvent {
  UpdateList(this.list);
  final ListOfThings list;
}

class DeleteList extends ListCrudEvent {
  DeleteList(this.listId);
  final String listId;
}
