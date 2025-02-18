import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// An item with sub menu for using in popup menus
///
/// [title] is the text which will be displayed in the pop up
/// [items] is the list of items to populate the sub menu
/// [onSelected] is the callback to be fired if specific item is pressed
///
/// Selecting items from the submenu will automatically close the parent menu
/// Closing the sub menu by clicking outside of it, will automatically close the parent menu
class PopupSubMenuItem<T> extends PopupMenuEntry<T> {
  const PopupSubMenuItem({
    required this.title,
    required this.items,
    required this.onSelected,
    super.key,
  });

  final String title;
  final List<T> items;
  final void Function(T) onSelected;

  @override
  double get height =>
      kMinInteractiveDimension; //Does not actually affect anything

  @override
  bool represents(T? value) =>
      false; //Our submenu does not represent any specific value for the parent menu

  @override
  State createState() => _PopupSubMenuState<T>();
}

/// The [State] for [PopupSubMenuItem] subclasses.
class _PopupSubMenuState<T> extends State<PopupSubMenuItem<T>> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      tooltip: widget.title,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 8, top: 12, bottom: 12),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(widget.title),
            ),
            Icon(
              Icons.arrow_right,
              size: 24,
              color: Theme.of(context).iconTheme.color,
            ),
          ],
        ),
      ),
      onCanceled: () {
        if (Navigator.canPop(context)) {
          GoRouter.of(context).pop();
        }
      },
      onSelected: (T value) {
        if (Navigator.canPop(context)) {
          GoRouter.of(context).pop();
        }
        widget.onSelected.call(value);
      },
      itemBuilder: (BuildContext context) {
        return widget.items
            .map(
              (item) => PopupMenuItem<T>(
                value: item,
                child: Text(
                  item.toString(),
                ), //MEthod toString() of class T should be overridden to repesent something meaningful
              ),
            )
            .toList();
      },
    );
  }
}
