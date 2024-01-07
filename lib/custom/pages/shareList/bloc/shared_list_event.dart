import 'package:flutter/material.dart';

@immutable
sealed class SharedListEvent {}

class LoadSharedList extends SharedListEvent {
  LoadSharedList(this.shareCode);
  final String shareCode;
}
