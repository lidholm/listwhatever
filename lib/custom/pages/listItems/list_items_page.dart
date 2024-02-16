import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_event.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_state.dart';
import 'package:listwhatever/custom/pages/listItems/map/flutter_maps_view.dart';
import 'package:listwhatever/custom/pages/lists/list_crud_events/list_crud_bloc.dart';
import 'package:listwhatever/custom/pages/lists/list_crud_events/list_crud_event.dart';
import 'package:listwhatever/custom/pages/lists/list_crud_events/list_crud_state.dart';
import 'package:listwhatever/custom/pages/lists/list_load_events/list_load_bloc.dart';
import 'package:listwhatever/custom/pages/lists/list_load_events/list_load_event.dart';
import 'package:listwhatever/custom/pages/lists/list_load_events/list_load_state.dart';
import 'package:listwhatever/custom/pages/lists/models/list_of_things.dart';
import 'package:listwhatever/standard/constants.dart';

import '/custom/navigation/routes.dart';
import '/custom/pages/import/csv/import_csv_page_route.dart';
import '/custom/pages/listItems/addListItem/add_list_item_page_route.dart';
import '/custom/pages/listItems/filters/filter_list_items.dart';
import '/custom/pages/listItems/filters/filters.dart';
import '/custom/pages/listItems/infoView/list_item_info_view.dart';
import '/custom/pages/listItems/list_or_list_item_not_loaded_handler.dart';
import '/custom/pages/lists/addList/edit_list_page_route.dart';
import '/custom/pages/shareList/share_list_page_route.dart';
import '/l10n/l10n.dart';
import '/standard/widgets/appBar/app_bar_action.dart';
import '/standard/widgets/appBar/app_bar_action_dropdown.dart';
import '/standard/widgets/appBar/app_bar_action_icon.dart';
import '/standard/widgets/appBar/app_bar_action_overflow_icon.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import 'filters/bloc/filter_bloc.dart';
import 'filters/bloc/filter_state.dart';
import 'filters/filter_view.dart';
import 'list_item.dart';
import 'list_items_list_view.dart';
import 'list_items_page_view_cubit.dart';
import 'list_items_sort_order_cubit.dart';

class ListItemsPage extends StatefulWidget {
  const ListItemsPage({required this.listId, super.key});

  final String listId;

  @override
  State<ListItemsPage> createState() => _ListItemsPageState();
}

class _ListItemsPageState extends State<ListItemsPage> {
  @override
  void initState() {
    BlocProvider.of<ListItemsLoadBloc>(context).add(WatchListItems(widget.listId));
    BlocProvider.of<ListLoadBloc>(context).add(LoadList(widget.listId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final listItemsState = context.watch<ListItemsLoadBloc>().state;
        final filtersState = context.watch<FilterBloc>().state;

        final viewToShow = context.watch<ListItemsPageViewCubit>().state;
        final sortOrder = context.watch<ListItemsSortOrderCubit>().state;
        final listState = context.watch<ListLoadBloc>().state;

        final notLoadedView = getNotLoadedView(listState, listItemsState, filtersState);
        if (notLoadedView != null) {
          return notLoadedView;
        }

        final filters = (filtersState as FiltersUpdated).filters;
        final list = (listState is ListLoadLoaded) ? listState.list : null;
        final listName = (listState is ListLoadLoaded) ? listState.list?.name ?? '' : '';
        final listItems = (listItemsState as ListItemsLoadLoaded).listItems;

        return BlocListener<ListCrudBloc, ListCrudState>(
          listener: (context, state) {
            print('state: $state');
            if (state is ListCrudDeleted) {
              GoRouter.of(context).pop();
            }
          },
          child: Scaffold(
            appBar: CommonAppBar(
              title: context.l10n.listItemsHeader(listName),
              actions: getAppBarActions(listState, viewToShow, sortOrder, filters),
            ),
            body: showLoadedItems(list, listItems, viewToShow, filters, sortOrder, widget.listId),
            floatingActionButton: list?.shareType == ShareType.editor
                ? FloatingActionButton(
                    onPressed: () {
                      AddListItemPageRoute(widget.listId).push<void>(context);
                    },
                    child: const Icon(Icons.add),
                  )
                : null,
          ),
        );
      },
    );
  }

  Widget showLoadedItems(
    ListOfThings? list,
    List<ListItem> listItems,
    ListItemsPageView viewToShow,
    Filters filters,
    (ListItemsSortOrder, SortOrder) sortOrder,
    String userListId,
  ) {
    logger
          ..d('=======================')
          ..d('number of items: ${listItems.length}')
        // ..d('items: $listItems')
        // ..d('items:\n${listItems.map((i) => '${i.latLong} - ${i.name} ').join('\n')}');
        ;
    final filteredItems = filterItems(list, listItems, filters);
    logger
      ..d('filters: $filters')
      ..d('filteredItems: ${filteredItems.length}');

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
        onTap: (itemId) => showDetailsView(userListId, itemId),
      );
    } else {
      return FlutterMapsView(
        items: filteredItems,
        onTap: (itemId) => showDetailsView(userListId, itemId),
      );
      //  return GoogleMapsView(
      //   items: filteredItems,
      //   onTap: (itemId) => showDetailsView(userListId, itemId),
      // );
    }
  }

  List<ListItem> filterItems(ListOfThings? list, List<ListItem> items, Filters filters) {
    return filterListItems(
      allItems: items,
      filters: filters,
      listHasDates: list?.withDates ?? false,
      listHasMap: list?.withMap ?? false,
      distanceFilterCenter: null, // TODO: Implement
    );
  }

  void showDetailsView(String? listId, String itemId) {
    showModalBottomSheet<ListItemInfoView>(
      context: context,
      builder: (context) => ListItemInfoView(listId: listId, itemId: itemId),
    );
  }

  List<AppBarAction<dynamic>> getAppBarActions(
    ListLoadState listState,
    ListItemsPageView viewToShow,
    (ListItemsSortOrder, SortOrder) sortOrder,
    Filters filters,
  ) {
    final list = (listState is ListLoadLoaded) ? listState.list : null;

    final actions = [
      getShowListViewAction(listState, viewToShow),
      getShowMapViewAction(listState, viewToShow),
      getShowSortAction(listState, viewToShow, sortOrder),
      getShowFilterAction(list, filters),
      getShowShareListAction(list, filters),
      getShowEditAction(list),
      getShowDeleteAction(list),
      getShowImportAction(),
    ].nonNulls.toList();

    return actions;
  }

  AppBarAction<AppBarActionIcon>? getShowListViewAction(
    ListLoadState state,
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
    ListLoadState state,
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
    ListLoadState state,
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
    ListLoadState state,
    ListItemsPageView viewToShow,
  ) {
    if (state is! ListLoadLoaded) {
      return false;
    }
    final list = state.list;
    final withMap = list?.withMap;
    return withMap ?? false;
  }

  AppBarAction<AppBarActionIcon>? getShowFilterAction(ListOfThings? list, Filters filters) {
    if (list == null || list.id == null) {
      return null;
    }
    return AppBarAction(
      type: AppBarActionType.icon,
      iconAction: AppBarActionIcon(
        title: context.l10n.filterMenuText,
        icon: filters.anySelectedFilters(
          listHasDates: list.withDates,
          listHasMap: list.withMap,
        )
            ? Icons.filter_alt
            : Icons.filter_alt_outlined,
        callback: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return FilterView(listId: widget.listId);
            },
          );
        },
        key: const Key('filterListItems'),
      ),
    );
  }

  AppBarAction<AppBarActionIcon>? getShowShareListAction(ListOfThings? list, Filters filters) {
    if (list == null) {
      return null;
    }

    return AppBarAction(
      type: AppBarActionType.icon,
      iconAction: AppBarActionIcon(
        title: context.l10n.shareListMenuText,
        icon: Icons.share,
        callback: () {
          ShareListPageRoute(widget.listId).push<void>(context);
        },
        key: const Key('shareListMenuItem'),
      ),
    );
  }

  AppBarAction<AppBarActionOverflowIcon>? getShowEditAction(ListOfThings? list) {
    if (list == null || list.id == null) {
      return null;
    }

    return AppBarAction(
      type: AppBarActionType.overflowIcon,
      overflowIcon: AppBarActionOverflowIcon(
        title: context.l10n.editList,
        icon: Icons.edit,
        callback: () async {
          final listBloc = context.read<ListLoadBloc>();
          await EditListPageRoute(widget.listId).push<void>(context);
          listBloc.add(LoadList(widget.listId));
        },
        key: const Key('editList'),
      ),
    );
  }

  AppBarAction<AppBarActionOverflowIcon>? getShowDeleteAction(ListOfThings? list) {
    if (list == null || list.id == null) {
      return null;
    }
    return AppBarAction(
      type: AppBarActionType.overflowIcon,
      overflowIcon: AppBarActionOverflowIcon(
        title: context.l10n.deleteList,
        icon: Icons.delete,
        callback: () async {
          context.read<ListCrudBloc>().add(DeleteList(widget.listId));
        },
        key: const Key('deleteList'),
      ),
    );
  }

  AppBarAction<dynamic> getShowImportAction() {
    return AppBarAction(
      type: AppBarActionType.overflowIcon,
      overflowIcon: AppBarActionOverflowIcon(
        title: context.l10n.importListItems,
        icon: Icons.import_export,
        callback: () async {
          await ImportCsvPageRoute(widget.listId).push<void>(context);
        },
        key: const Key('deleteList'),
      ),
    );
  }

  Widget? getNotLoadedView(ListLoadState listState, ListItemsLoadState listItemsState, FilterState filtersState) {
    final filtersNotLoadedView = handleFiltersNotLoaded(filtersState);
    if (filtersNotLoadedView != null) {
      return filtersNotLoadedView;
    }

    final listStateView = ListOrListItemNotLoadedHandler.handleListAndListItemsState(listState, listItemsState);
    if (listStateView != null) {
      return listStateView;
    }
    return null;
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
