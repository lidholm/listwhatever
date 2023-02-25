import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bar_action.freezed.dart';

@freezed
class AppBarAction with _$AppBarAction {
  factory AppBarAction({
    required String title,
    required IconData icon,
    required void Function() callback,
    required bool overflow,
  }) = _AppBarAction;
}
