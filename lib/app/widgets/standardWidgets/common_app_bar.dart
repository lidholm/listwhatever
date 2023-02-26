import 'package:flutter/material.dart';
import 'package:listanything/app/widgets/standardWidgets/app_bar_action.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key, required this.title, this.actions = const <AppBarAction>[]})
      // ignore: avoid_field_initializers_in_const_classes
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  final String title;
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
          Text(title),
        ],
      ),
      actions: [
        ...actions
            .where((element) => !element.overflow)
            .map(
              (e) => IconButton(
                icon: Icon(e.icon),
                tooltip: e.title,
                onPressed: e.callback,
              ),
            )
            .toList(),
        if (actions.where((e) => e.overflow).isNotEmpty) popupMenuButtons
      ],
    );
  }
}
