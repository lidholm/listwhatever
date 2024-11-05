import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/filters/bloc/filter_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/filters/bloc/filter_state.dart';
import 'package:listwhatever/custom/pages/listItems/filters/filtering.dart';
import 'package:listwhatever/custom/pages/listItems/listItemsListView/list_item_widget.dart';
import 'package:listwhatever/custom/pages/listItems/listItemsListView/list_items_sort_order_cubit.dart';
import 'package:listwhatever/custom/pages/listItems/listItemsListView/selected_list_item_cubit.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_state.dart';
import 'package:listwhatever/custom/pages/lists/list_load_events/list_load_bloc.dart';
import 'package:listwhatever/custom/pages/lists/list_load_events/list_load_state.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/widgets/shimmer/shimmer_loading.dart';

import '/standard/widgets/vStack/v_stack.dart';

class ListItemsListView extends StatelessWidget {
  const ListItemsListView({
    required this.onTap,
    required this.onEdit,
    super.key,
  });

  final void Function(String itemId) onTap;
  final void Function(String itemId) onEdit;

  @override
  Widget build(BuildContext context) {
    final sortOrder = context.watch<ListItemsSortOrderCubit>().state;

    final listState = context.watch<ListLoadBloc>().state;
    final listItemsState = context.watch<ListItemsLoadBloc>().state;
    final filtersState = context.watch<FilterBloc>().state;

    var isLoading = true;
    var items = generateShimmerListItem(3);

    if (listState is ListLoadLoaded &&
        listItemsState is ListItemsLoadLoaded &&
        filtersState is FiltersUpdated) {
      isLoading = false;
      final list = listState.list!;
      final listItems = listItemsState.listItems;
      final filters = filtersState.filters;

      items = Filtering.sortAndFilterItems(
        list,
        listItems,
        filters,
        sortOrder,
      );
    }

    return ShimmerLoading(
      isLoading: isLoading,
      child: BlocProvider(
        create: (_) => SelectedListItemCubit(),
        child: BlocBuilder<SelectedListItemCubit, String?>(
          builder: (context, selectListItemId) {
            return Padding(
              padding: const EdgeInsets.only(top: 24),
              child: SingleChildScrollView(
                child: VStack(
                  spacing: 16,
                  children: [
                    if (items.isEmpty)
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('No items')],
                      ),
                    if (items.isNotEmpty)
                      ...items.map(
                        (item) => ListItemWidget(
                          item: item,
                          isLoading: isLoading,
                          selectListItemId: selectListItemId,
                          onTap: onTap,
                          onEdit: onEdit,
                        ),
                      ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
