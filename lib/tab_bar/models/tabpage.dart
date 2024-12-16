import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tabpage.freezed.dart';

@freezed
class TabPage with _$TabPage {
  factory TabPage({
    required String key,
    required String Function(BuildContext) label,
    required IconData icon,
    required Widget page,
  }) = _TabPage;
}
