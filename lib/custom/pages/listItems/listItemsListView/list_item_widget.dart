import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/listItemsListView/selected_list_item_cubit.dart';
import 'package:listwhatever/custom/pages/listItems/models/list_item.dart';
import 'package:listwhatever/standard/helpers/date_format_helper.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    required this.item,
    required this.isLoading,
    required this.selectListItemId,
    required this.onTap,
    required this.onEdit,
    super.key,
  });

  final ListItem item;
  final bool isLoading;
  final String? selectListItemId;
  final void Function(String itemId) onTap;
  final void Function(String itemId) onEdit;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildShimmerItem();
    }
    return _buildItemRegular(context, item, selectListItemId);
  }

  Widget _buildShimmerItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemRegular(
    BuildContext context,
    ListItem item,
    String? selectListItemId,
  ) {
    return GestureDetector(
      onTap: () {
        context.read<SelectedListItemCubit>().click(item.id);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getTitle(item),
                ...getSubtitle(
                  context,
                  selectListItemId,
                  item,
                ),
              ],
            ),
            getActionIcon(selectListItemId, item),
          ],
        ),
      ),
    );
  }

  Widget getTitle(ListItem item) {
    var text = item.name;

    if (item.datetime != null) {
      // TODO: Check if time should be shown
      text =
          '${item.name} - ${DateFormatHelper.formatReadableDate(item.datetime!, DateFormatType.iso8601)}';
    }

    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.black.withAlpha(200),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  List<Widget> getSubtitle(
    BuildContext context,
    String? selectedItemId,
    ListItem item,
  ) {
    if (selectedItemId != item.id || selectedItemId == null) {
      return getCategoriesSubtitle(context, item);
    }
    return getDetailedSubtitle(item);
  }

  List<Widget> getCategoriesSubtitle(BuildContext context, ListItem item) {
    final theme = Theme.of(context);

    return [
      Row(
        children: [
          ...item.categories.entries
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8),
                  child: Chip(
                    backgroundColor: theme.primaryColor,
                    padding: const EdgeInsets.only(right: 2),
                    side: BorderSide(width: 0, color: theme.primaryColor),
                    label: Text(
                      '${e.key}: ${e.value.join(', ')}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              )
              .take(4),
          if (item.categories.length > 4) const Text('...'),
        ],
      ),
    ];
  }

  List<Widget> getDetailedSubtitle(ListItem item) {
    final list = [
      if (item.address != null) Text('Address: ${item.address}'),
      for (final category in item.categories.entries)
        Text('${category.key}: ${category.value.join(', ')}'),
      for (final url in item.urls) Text(url),
      if (item.info != null)
        Text(
          '${item.info?.substring(0, min(100, item.info?.length ?? 0))} ${item.info!.length > 100 ? '...' : ''}',
        ),
    ];
    if (list.isEmpty) return [const Text('No information')];
    return list;
  }

  IconButton getActionIcon(String? selectListItemId, ListItem item) {
    if (selectListItemId != null && selectListItemId == item.id) {
      return IconButton(
        onPressed: () {
          onEdit(item.id!);
        },
        icon: const Icon(
          Icons.edit,
        ),
      );
    }
    return IconButton(
      onPressed: () {
        onTap(item.id!);
      },
      icon: const Icon(
        Icons.keyboard_arrow_right_rounded,
      ),
    );
  }
}
