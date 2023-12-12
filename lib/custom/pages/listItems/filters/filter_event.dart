import 'package:flutter/material.dart';

import 'filters.dart';

@immutable
sealed class FilterEvent {}

class UpdateFilters extends FilterEvent {
  UpdateFilters(this.filters);

  final Filters filters;
}
