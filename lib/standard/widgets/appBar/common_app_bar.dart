import 'package:flutter/material.dart';
import '/standard/widgets/appBar/app_bar_action_dropdown.dart';
import '/standard/widgets/appBar/app_bar_action_icon.dart';
import '/standard/widgets/appBar/app_bar_action_overflow_icon.dart';

import 'app_bar_action.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    required this.title,
    this.actions = const <AppBarAction<dynamic>>[],
    this.titleWidget,
    this.toolbarHeight = 56,
    super.key,
  });

  final double toolbarHeight;
  final String title;
  final Widget? titleWidget;
  final List<AppBarAction<dynamic>> actions;

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    final overflowMenu = getOverflowMenu();
    final actionButtons = getActionButtons();

    return AppBar(
      flexibleSpace: titleWidget,
      title: titleWidget == null ? Text(title) : null,
      actions: [
        ...actionButtons,
        if (overflowMenu != null) overflowMenu,
      ],
    );
  }

  PopupMenuButton<AppBarActionOverflowIcon>? getOverflowMenu() {
    final overflowActions = actions
        .where((a) => a.type == AppBarActionType.overflowIcon)
        .map((a) => a.overflowIcon!)
        .toList();
    if (overflowActions.isEmpty) {
      return null;
    }
    return PopupMenuButton<AppBarActionOverflowIcon>(
      onSelected: (selectedAction) {
        selectedAction.callback();
      },
      itemBuilder: (BuildContext context) {
        return overflowActions.map((AppBarActionOverflowIcon action) {
          return PopupMenuItem<AppBarActionOverflowIcon>(
            value: action,
            key: action.key,
            child: Row(
              children: [
                Icon(
                  action.icon,
                  size: 24,
                  color: Colors.black,
                ),
                Text(action.title),
              ],
            ),
          );
        }).toList();
      },
    );
  }

  List<Widget> getActionButtons() {
    return actions
        .map(
          (a) => switch (a.type) {
            AppBarActionType.icon => getActionIconButton(a.iconAction!),
            AppBarActionType.dropdown => getDropdownButton(a.dropdownAction!),
            AppBarActionType.overflowIcon => null,
          },
        )
        .where((a) => a != null)
        .map((a) => a!)
        .toList();
  }

  IconButton getActionIconButton(AppBarActionIcon e) {
    return IconButton(
      key: e.key,
      icon: Icon(e.icon),
      tooltip: e.title,
      onPressed: e.callback,
    );
  }

  Widget getDropdownButton<T>(AppBarActionDropdown<T> a) {
    return PopupMenuButton(
      icon: Icon(a.icon),
      tooltip: a.tooltip,
      onSelected: a.callback,
      itemBuilder: (BuildContext context) {
        return a.menuItems
            .map(
              (i) => PopupMenuItem(
                value: i.$1,
                child: i.$2,
              ),
            )
            .toList();
      },
    );
  }
}
