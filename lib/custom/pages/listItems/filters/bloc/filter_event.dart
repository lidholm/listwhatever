import 'package:flutter/material.dart';
import '/custom/pages/listItems/filters/filters.dart';

@immutable
sealed class FilterEvent {}

class UpdateFilters extends FilterEvent {
  UpdateFilters(this.filters);

  final Filters filters;
}
