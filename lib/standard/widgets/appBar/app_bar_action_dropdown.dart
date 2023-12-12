import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bar_action_dropdown.freezed.dart';

@freezed
class AppBarActionDropdown<T> with _$AppBarActionDropdown<T> {
  factory AppBarActionDropdown({
    required IconData icon,
    required String? tooltip,
    required void Function(T) callback,
    required List<(T, Widget)> menuItems,
    required Key key,
  }) = _AppBarActionDropdown;
}
