import 'package:flutter/material.dart';
import '/app/custom/pages/list_items/list_item.dart';
import '/app/custom/pages/list_items/list_item_item.dart';
import '/app/standard/firebase/current_user.dart';

class ListItems extends StatelessWidget {
  const ListItems({
    required this.publicListId,
    required this.isListViewOnly,
    required this.items,
    required this.firestoreUser,
    super.key,
  });
  final String publicListId;
  final List<ListItem> items;
  final bool isListViewOnly;
  final CurrentUser? firestoreUser;

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
              firestoreUser: firestoreUser,
            ),
          );
        },
        childCount: items.length,
      ),
    );
  }
}
