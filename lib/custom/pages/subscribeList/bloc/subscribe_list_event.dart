import 'package:flutter/material.dart';

@immutable
sealed class SubscribeListEvent {}

class SubscribeListForUser extends SubscribeListEvent {
  SubscribeListForUser(this.shareCode);
  final String shareCode;
}
