import 'package:flutter/material.dart';
import 'package:listanything/app/common_theme_data.dart';
import 'package:listanything/app/widgets/standardWidgets/app_bar_action.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    required this.title,
    this.actions = const <AppBarAction>[],
    this.titleWidget,
    super.key,
  })
  // ignore: avoid_field_initializers_in_const_classes
  : preferredSize = const Size.fromHeight(kToolbarHeight);

  final String title;
  final Widget? titleWidget;
  final List<AppBarAction> actions;
  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    final popupMenuButtons = // overflow menu
        PopupMenuButton<AppBarAction>(
      onSelected: (selectedAction) {
        selectedAction.callback();
      },
      itemBuilder: (BuildContext context) {
        return actions.where((e) => e.overflow).map((AppBarAction action) {
          return PopupMenuItem<AppBarAction>(
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

    return AppBar(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          titleWidget ?? Text(title),
        ],
      ),
      actions: [
        ...actions.where((element) => !element.overflow).map(
              (e) => IconButton(
                key: e.key,
                icon: Icon(e.icon),
                tooltip: e.title,
                onPressed: e.callback,
              ),
            ),
        if (actions.where((e) => e.overflow).isNotEmpty) popupMenuButtons
      ],
      backgroundColor: secondaryButtonColor,
    );
  }
}
