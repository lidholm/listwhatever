import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_bar_action_dropdown.dart';
import 'app_bar_action_icon.dart';
import 'app_bar_action_overflow_icon.dart';

part 'app_bar_action.freezed.dart';

enum AppBarActionType {
  icon,
  dropdown,
  overflowIcon,
}

@freezed
class AppBarAction<T> with _$AppBarAction<T> {
  factory AppBarAction({
    required AppBarActionType type,
    @Default(null) AppBarActionIcon? iconAction,
    @Default(null) AppBarActionDropdown<T>? dropdownAction,
    @Default(null) AppBarActionOverflowIcon? overflowIcon,
  }) = _AppBarAction;
}
