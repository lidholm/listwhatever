import 'package:flutter/material.dart';
import 'package:listanything/app/firebase/firestore_user.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_item_item.dart';

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
  final FirestoreUser? firestoreUser;

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
