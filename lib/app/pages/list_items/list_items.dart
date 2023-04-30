import 'package:flutter/material.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_item_item.dart';

class ListItems extends StatelessWidget {
  const ListItems({
    required this.publicListId,
    required this.isListViewOnly,
    required this.items,
    super.key,
  });
  final String publicListId;
  final List<ListItem> items;
  final bool isListViewOnly;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
            child: ListItemItem(
              publicListId: publicListId,
              isListViewOnly: isListViewOnly,
              item: items[index],
              isLoading: false,
            ),
          );
        },
        childCount: items.length,
      ),
    );
  }
}
