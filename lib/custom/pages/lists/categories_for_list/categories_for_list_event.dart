import 'package:flutter/material.dart';

@immutable
sealed class CategoriesForListEvent {}

class ChangeUserForCategoriesForList extends CategoriesForListEvent {
  ChangeUserForCategoriesForList(this.userId);
  final String? userId;
}

class LoadCategoriesForList extends CategoriesForListEvent {
  LoadCategoriesForList(this.listId);
  final String listId;
}
