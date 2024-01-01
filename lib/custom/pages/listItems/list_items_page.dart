import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:allmylists/custom/firestore/listItems/infoView/list_item_info_view.dart';
import 'package:allmylists/custom/firestore/listItems/list_item.dart';
import 'package:allmylists/custom/firestore/listItems/list_items.dart';
import 'package:allmylists/custom/firestore/listItems/list_items_list_view.dart';
import 'package:allmylists/custom/firestore/listItems/list_items_page_view_cubit.dart';
import 'package:allmylists/custom/firestore/listItems/list_items_sort_order_cubit.dart';
import 'package:allmylists/custom/firestore/listItems/list_or_list_item_not_loaded_handler.dart';
import 'package:allmylists/custom/firestore/listItems/map/maps_view.dart';
import 'package:allmylists/custom/firestore/lists/lists.dart';
import 'package:allmylists/custom/navigation/routes.dart';
import 'package:allmylists/custom/pages/listItems/addListItem/add_list_item_page_route.dart';
import 'package:allmylists/custom/pages/listItems/filters/filter_bloc.dart';
import 'package:allmylists/custom/pages/listItems/filters/filter_list_items.dart';
import 'package:allmylists/custom/pages/listItems/filters/filters.dart';
import 'package:allmylists/custom/pages/lists/addList/edit_list_page_route.dart';
import 'package:allmylists/custom/pages/lists/lists_page_route.dart';
import 'package:allmylists/custom/pages/shareList/share_list_page_route.dart';
import 'package:allmylists/l10n/l10n.dart';
import 'package:allmylists/standard/navigation/redirect_cubit.dart';
import 'package:allmylists/standard/widgets/appBar/app_bar_action.dart';
import 'package:allmylists/standard/widgets/appBar/app_bar_action_dropdown.dart';
import 'package:allmylists/standard/widgets/appBar/app_bar_action_icon.dart';
import 'package:allmylists/standard/widgets/appBar/app_bar_action_overflow_icon.dart';
import 'package:allmylists/standard/widgets/appBar/common_app_bar.dart';

import 'filters/filter_state.dart';
import 'filters/filter_view.dart';

class ListItemsPage extends StatefulWidget {
  const ListItemsPage({required this.listId, super.key});

  final String listId;

  @override
  State<ListItemsPage> createState() => _ListItemsPageState();
}

class _ListItemsPageState extends State<ListItemsPage> {
  @override
  void initState() {
    BlocProvider.of<ListItemsBloc>(context).add(WatchListItems(widget.listId));
    BlocProvider.of<ListBloc>(context).add(LoadList(widget.listId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final listItemState = context.watch<ListItemsBloc>().state;
        // logger.d('listItemState: $listItemState');
        final filtersState = context.watch<FilterBloc>().state;

        final filtersNotLoadedView = handleFiltersNotLoaded(filtersState);
        if (filtersNotLoadedView != null) {
          return filtersNotLoadedView;
        }
        final filters = (filtersState as FiltersUpdated).filters;
        // logger.d('filters: $filters');

        final viewToShow = context.watch<ListItemsPageViewCubit>().state;
        final sortOrder = context.watch<ListItemsSortOrderCubit>().state;
        final listState = context.watch<ListBloc>().state;

        final listStateView = ListOrListItemNotLoadedHandler.handleListAndListItemsState(listState, listItemState);
        // logger.i('listState: $listState');
        if (listStateView != null) {
          return listStateView;
        }

        final showListViewAction = getShowListViewAction(listState, viewToShow);
        final showMapViewAction = getShowMapViewAction(listState, viewToShow);
        final showSortAction = getShowSortAction(listState, viewToShow, sortOrder);

        final list = (listState is ListLoaded) ? listState.list : null;
        final listId = list?.id;
        final listName = (listState is ListLoaded) ? listState.list?.name ?? '' : '';

        return Scaffold(
          appBar: CommonAppBar(
            title: context.l10n.listItemsHeader(listName),
            actions: [
              if (showListViewAction != null) showListViewAction,
              if (showMapViewAction != null) showMapViewAction,
              if (showSortAction != null) showSortAction,
              if (listId != null)
                AppBarAction(
                  type: AppBarActionType.icon,
                  iconAction: AppBarActionIcon(
                    title: context.l10n.filterMenuText,
                    icon: filters.anySelectedFilters(
                            listHasDates: list?.withDates ?? false, listHasMap: list?.withMap ?? false)
                        ? Icons.filter_alt
                        : Icons.filter_alt_outlined,
                    callback: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return FilterView(listId: listId);
                        },
                      );
                    },
                    key: const Key('filterListItems'),
                  ),
                ),
              if (list?.isOwnList ?? false)
                AppBarAction(
                  type: AppBarActionType.icon,
                  iconAction: AppBarActionIcon(
                    title: context.l10n.shareListMenuText,
                    icon: Icons.share,
                    callback: () {
                      ShareListPageRoute(widget.listId).push<void>(context);
                    },
                    key: const Key('shareListMenuItem'),
                  ),
                ),
              if (listId != null) ...[
                if (list?.shareType == ShareType.editor)
                  AppBarAction(
                    type: AppBarActionType.overflowIcon,
                    overflowIcon: AppBarActionOverflowIcon(
                      title: context.l10n.editList,
                      icon: Icons.edit,
                      callback: () async {
                        final listBloc = context.read<ListBloc>();
                        await EditListPageRoute(listId).push<void>(context);
                        listBloc.add(LoadList(listId));
                      },
                      key: const Key('editList'),
                    ),
                  ),
                AppBarAction(
                  type: AppBarActionType.overflowIcon,
                  overflowIcon: AppBarActionOverflowIcon(
                    title: context.l10n.deleteList,
                    icon: Icons.delete,
                    callback: () async {
                      context
                          .read<RedirectCubit>()
                          .setRedirect('${const ListsPageRoute().location}?t=${DateTime.now()}');
                      context.read<ListBloc>().add(DeleteList(listId));
                    },
                    key: const Key('deleteList'),
                  ),
                ),
              ],
            ],
          ),
          body: switch (listItemState) {
            ListItemsLoading() => const Center(child: CircularProgressIndicator()),
            ListItemsInitial() => Container(),
            ListItemsLoaded() => showLoadedItems(list, listItemState, viewToShow, filters, sortOrder),
            ListItemsOperationSuccess() => Container(),
            ListItemsError() => Center(child: Text(listItemState.errorMessage)),
          },
          floatingActionButton: list?.shareType == ShareType.editor
              ? FloatingActionButton(
                  onPressed: () {
                    AddListItemPageRoute(widget.listId).push<void>(context);
                  },
                  child: const Icon(Icons.add),
                )
              : null,
        );
      },
    );
  }

  Widget showLoadedItems(
    ListOfThings? list,
    ListItemsLoaded state,
    ListItemsPageView viewToShow,
    Filters filters,
    (ListItemsSortOrder, SortOrder) sortOrder,
  ) {
    final items = state.listItems;
    // logger.d('number of items: ${items.length}');
    // logger.d('items: $items');
    // logger.d('items:\n${items.map((i) => '${i.latLong} - ${i.name} ').join('\n')}');

    final filteredItems = filterItems(list, items, filters);

    if (viewToShow == ListItemsPageView.listView) {
      final multiplier = sortOrder.$2 == SortOrder.ascending ? 1 : -1;
      final sortedItems = filteredItems
        ..sort(
          (a, b) => switch (sortOrder.$1) {
            ListItemsSortOrder.name => a.name.compareTo(b.name) * multiplier,
            ListItemsSortOrder.date => (a.datetime ?? DateTime(1)).compareTo(b.datetime ?? DateTime(1)) * multiplier,
            ListItemsSortOrder.distance => a.name.compareTo(b.name) * multiplier,
          },
        );
      return ListItemsListView(
        listId: list?.id,
        items: sortedItems,
        onTap: (itemId) => showDetailsView(list?.id, itemId),
      );
    } else {
      return MapsView(
        items: filteredItems,
        onTap: (itemId) => showDetailsView(list!.id, itemId),
      );
    }
  }

  AppBarAction<String>? getShowListViewAction(
    ListState state,
    ListItemsPageView viewToShow,
  ) {
    if (!shouldShowListOrMapAction(state, viewToShow)) {
      return null;
    }
    if (viewToShow == ListItemsPageView.listView) {
      return null;
    }
    return AppBarAction(
      type: AppBarActionType.icon,
      iconAction: AppBarActionIcon(
        title: context.l10n.showAsList,
        icon: Icons.list,
        callback: () {
          context.read<ListItemsPageViewCubit>().toggle();
        },
        key: const Key('showListView'),
      ),
    );
  }

  AppBarAction<dynamic>? getShowMapViewAction(
    ListState state,
    ListItemsPageView viewToShow,
  ) {
    if (!shouldShowListOrMapAction(state, viewToShow)) {
      return null;
    }
    if (viewToShow == ListItemsPageView.mapsView) {
      return null;
    }
    return AppBarAction(
      type: AppBarActionType.icon,
      iconAction: AppBarActionIcon(
        title: context.l10n.showAsMap,
        icon: Icons.map,
        callback: () {
          context.read<ListItemsPageViewCubit>().toggle();
        },
        key: const Key('showMapsView'),
      ),
    );
  }

  AppBarAction<dynamic>? getShowSortAction(
    ListState state,
    ListItemsPageView viewToShow,
    (ListItemsSortOrder, SortOrder) sortOrder,
  ) {
    if (!shouldShowListOrMapAction(state, viewToShow)) {
      return null;
    }
    if (viewToShow == ListItemsPageView.mapsView) {
      return null;
    }
    return AppBarAction(
      type: AppBarActionType.dropdown,
      dropdownAction: AppBarActionDropdown<dynamic>(
        icon: Icons.sort,
        tooltip: context.l10n.sortActionText,
        callback: (dynamic value) {
          context.read<ListItemsSortOrderCubit>().select(value as ListItemsSortOrder);
          // logger.d('value: $value');
        },
        menuItems: [
          (ListItemsSortOrder.name, context.l10n.sortActionItemName),
          (ListItemsSortOrder.date, context.l10n.sortActionItemDate),
          (ListItemsSortOrder.distance, context.l10n.sortActionItemDistance),
        ]
            .map(
              (a) => (
                a.$1,
                Row(
                  children: [
                    if (a.$1 == sortOrder.$1)
                      Icon(sortOrder.$2 == SortOrder.ascending ? Icons.arrow_downward : Icons.arrow_upward),
                    Text(a.$2),
                  ],
                ),
              ),
            )
            .toList(),
        key: const Key('sortAction'),
      ),
    );
  }

  bool shouldShowListOrMapAction(
    ListState state,
    ListItemsPageView viewToShow,
  ) {
    if (state is! ListLoaded) {
      return false;
    }
    final list = state.list;
    final withMap = list?.withMap;
    return withMap ?? false;
  }

  List<ListItem> filterItems(ListOfThings? list, List<ListItem> items, Filters filters) {
    return filterListItems(
      allItems: items,
      filters: filters,
      listHasDates: list?.withDates ?? false,
      listHasMap: list?.withMap ?? false,
      distanceFilterCenter: null, // TODO
    );
  }

  void showDetailsView(String? listId, String itemId) {
    showModalBottomSheet<ListItemInfoView>(
      context: context,
      builder: (context) => ListItemInfoView(listId: listId, itemId: itemId),
    );
  }
}

Widget? handleFiltersNotLoaded(FilterState filtersState) {
  if (filtersState is FiltersUpdated) {
    return null;
  }
  if (filtersState is FiltersError) {
    return Text('FiltersError: ${filtersState.errorMessage}');
  }
  if (filtersState is UpdatingFilters) {
    return const Text('UpdatingFilters');
  }
  throw Exception("Shouldn't happen");
}
