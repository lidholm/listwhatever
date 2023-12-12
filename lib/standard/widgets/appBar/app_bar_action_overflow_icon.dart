import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bar_action_overflow_icon.freezed.dart';

@freezed
class AppBarActionOverflowIcon with _$AppBarActionOverflowIcon {
  factory AppBarActionOverflowIcon({
    required String title,
    required IconData icon,
    required void Function() callback,
    required Key key,
  }) = _AppBarActionOverflowIcon;
}
