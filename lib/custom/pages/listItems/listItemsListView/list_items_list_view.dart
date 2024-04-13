import 'package:flutter/material.dart';

import '/custom/pages/listItems/models/list_item.dart';
import '/standard/constants.dart';
import '/standard/widgets/vStack/v_stack.dart';

class ListItemsListView extends StatelessWidget {
  const ListItemsListView({required this.actualListId, required this.items, required this.onTap, super.key});

  final String? actualListId;
  final List<ListItem> items;
  final void Function(String itemId) onTap;

  @override
  Widget build(BuildContext context) {
    if (actualListId == null) {
      return const Text('No list');
    }

    return SingleChildScrollView(
      child: VStack(
        spacing: 0,
        children: [
          ...items.map((item) {
            final subtitle = item.datetime != null ? formatReadableDate(item.datetime!, DateFormatType.iso8601) : null;
            return Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withAlpha(200),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
          }),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
