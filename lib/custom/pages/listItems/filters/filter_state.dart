import 'package:flutter/material.dart';
import 'package:listanything/custom/pages/listItems/filters/filters.dart';

@immutable
sealed class FilterState {}

class UpdatingFilters extends FilterState {}

class FiltersUpdated extends FilterState {
  FiltersUpdated(this.filters);
  final Filters filters;
}

class FiltersError extends FilterState {
  FiltersError(this.errorMessage);
  final String errorMessage;
}
