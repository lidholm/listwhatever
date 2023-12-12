import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bar_action_icon.freezed.dart';

@freezed
class AppBarActionIcon with _$AppBarActionIcon {
  factory AppBarActionIcon({
    required String title,
    required IconData icon,
    required void Function() callback,
    required Key key,
  }) = _AppBarActionIcon;
}
