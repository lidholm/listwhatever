import 'package:flutter/material.dart';

@immutable
sealed class CategoriesForListState {}

class CategoriesForListInitial extends CategoriesForListState {}

class CategoriesForListLoading extends CategoriesForListState {}

class CategoriesForListLoaded extends CategoriesForListState {
  CategoriesForListLoaded(this.categoriesForList);
  final Map<String, Set<String>> categoriesForList;
}

class CategoriesForListError extends CategoriesForListState {
  CategoriesForListError(this.errorMessage);
  final String errorMessage;
}
