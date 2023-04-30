import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:listanything/app/pages/list_items/filters.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_item_app_bar.dart';
import 'package:listanything/app/pages/list_items/list_items.dart';
import 'package:listanything/app/pages/list_items/selected_filters.dart';
import 'package:listanything/app/pages/list_items/static.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';

class ListItemsListView extends HookWidget {
  const ListItemsListView({
    required this.isLoading,
    required this.list,
    required this.filters,
    required this.expandedPercentage,
    required this.items,
    super.key,
  });
  final bool isLoading;
  final ListOfThings? list;
  final Filters filters;
  final ValueNotifier<double> expandedPercentage;
  final List<ListItem> items;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        expandedPercentage.value = scrollController.hasClients
            ? max(
                1 -
                    (scrollController.offset /
                        (expandedBarHeight - collapsedBarHeight)),
                0,
              )
            : 0.0;

        return false;
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          ListItemAppBar(
            list: list,
            isLoading: isLoading,
            expandedPercentage: expandedPercentage.value,
          ),
          if (filters.anySelectedFilters(
            listHasDates: list?.withDates ?? false,
          )) ...[
            const Static(title: 'Filters'),
            SelectedFilters(filters: filters),
          ],
          const Static(title: 'Items'),
          ListItems(
            publicListId: list?.publicListId ?? '',
            isListViewOnly: (list?.isEditor ?? true) == false,
            items: items,
          ),
        ],
      ),
    );
  }
}
