import 'package:flutter/material.dart';
import 'package:listwhatever/standard/widgets/vStack/v_stack.dart';

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
      child: VStack(
        spacing: 0,
        children: items.map((item) {
          final subtitle = item.datetime != null ? formatReadableDate(item.datetime!, DateFormatType.iso8601) : null;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name),
                    if (subtitle != null)
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withAlpha(200),
                        ),
                      ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    onTap(item.id!);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_right_rounded,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
