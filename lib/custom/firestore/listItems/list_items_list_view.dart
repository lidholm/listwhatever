import 'package:flutter/material.dart';

import '/standard/constants.dart';
import 'list_item.dart';

class ListItemsListView extends StatelessWidget {
  const ListItemsListView({required this.listId, required this.items, required this.onTap, super.key});
  final String? listId;
  final List<ListItem> items;
  final void Function(String itemId) onTap;

  @override
  Widget build(BuildContext context) {
    if (listId == null) {
      return const Text('No list');
    }

    return SingleChildScrollView(
      child: Column(
        children: items.map((item) {
          return ListTile(
            title: Text(item.name),
            subtitle: Text(
              item.datetime != null ? formatReadableDate(item.datetime!, DateFormatType.iso8601) : '',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withAlpha(200),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                onTap(item.id!);
              },
              icon: const Icon(
                Icons.keyboard_arrow_right_rounded,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
