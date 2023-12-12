import 'package:flutter/material.dart';

@immutable
sealed class SearchEvent {}

class Search extends SearchEvent {
  Search(this.phrase);

  final String phrase;
}
