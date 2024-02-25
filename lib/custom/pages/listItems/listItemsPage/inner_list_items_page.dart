import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:listwhatever/standard/userRepository/models/user.dart';

import '/custom/navigation/routes.dart';
import '/custom/pages/import/csv/import_csv_page_route.dart';
import '/custom/pages/import/spreadsheet/list_as_spreadsheets_page_route.dart';
import '/custom/pages/listItems/addListItem/add_list_item_page_route.dart';
import '/custom/pages/listItems/filters/bloc/filter_state.dart';
import '/custom/pages/listItems/filters/filter_list_items.dart';
import '/custom/pages/listItems/filters/filter_view.dart';
import '/custom/pages/listItems/filters/filters.dart';
import '/custom/pages/listItems/infoView/list_item_info_view.dart';
import '/custom/pages/listItems/listItemsListView/list_items_list_view.dart';
import '/custom/pages/listItems/listItemsListView/list_items_sort_order_cubit.dart';
import '/custom/pages/listItems/map/flutter_maps_view.dart';
import '/custom/pages/listItems/models/list_item.dart';
import '/custom/pages/listItems/searchLocation/geocoder/latlong.dart';
import '/custom/pages/lists/addList/edit_list_page_route.dart';
import '/custom/pages/lists/list_crud_events/list_crud_bloc.dart';
import '/custom/pages/lists/list_crud_events/list_crud_event.dart';
import '/custom/pages/lists/list_load_events/list_load_bloc.dart';
import '/custom/pages/lists/list_load_events/list_load_event.dart';
import '/custom/pages/lists/models/list_of_things.dart';
import '/custom/pages/shareList/share_list_page_route.dart';
import '/l10n/l10n.dart';
import '/standard/constants.dart';
import '/standard/widgets/appBar/app_bar_action.dart';
import '/standard/widgets/appBar/app_bar_action_dropdown.dart';
import '/standard/widgets/appBar/app_bar_action_icon.dart';
import '/standard/widgets/appBar/app_bar_action_overflow_icon.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import 'list_items_page_view_cubit.dart';

class InnerListItemsPage extends StatefulWidget {
  const InnerListItemsPage(this.user, this.list, this.listItems, this.filters, this.currentLocation, this.viewToShow,
      {super.key});

  final User user;
  final ListOfThings list;
  final List<ListItem> listItems;
  final Filters filters;
  final Position? currentLocation;
  final ListItemsPageView viewToShow;

  @override
  State<InnerListItemsPage> createState() => _InnerListItemsPageState();
}

class _InnerListItemsPageState extends State<InnerListItemsPage> {
  bool showSideWidget = false;
  (ListItemsSortOrder, SortOrder) sortOrder = (ListItemsSortOrder.name, SortOrder.ascending);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: context.l10n.listItemsHeader(widget.list.name),
        actions: getAppBarActions(),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 10,
            child: showLoadedItems(),
          ),
          filterWidget(),
        ],
      ),
      floatingActionButton: widget.list.shareType == ShareType.editor
          ? FloatingActionButton(
              onPressed: () {
                AddListItemPageRoute(widget.list.id!).push<void>(context);
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  Widget filterWidget() {
    const widthForRightHandSideView = 400.0;
    const heightForBottomView = 400.0;
    const onRightHandSide = kIsWeb;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      right: onRightHandSide
          ? showSideWidget
              ? 0
              : -widthForRightHandSideView
          : null,
      left: onRightHandSide ? null : 0,
      top: onRightHandSide
          ? 0
          : showSideWidget
              ? MediaQuery.of(context).size.height - heightForBottomView
              : MediaQuery.of(context).size.height,
      height: onRightHandSide ? MediaQuery.of(context).size.height : heightForBottomView,
      width: onRightHandSide ? widthForRightHandSideView : MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            FilterView(
              list: widget.list,
              listItems: widget.listItems,
              filters: widget.filters,
              settings: widget.user.settings,
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget showLoadedItems() {
    logger
          ..d('=======================')
          ..d('number of items: ${widget.listItems.length}')
        // ..d('items: $listItems')
        // ..d('items:\n${listItems.map((i) => '${i.latLong} - ${i.name} ').join('\n')}');
        ;
    final filteredItems = filterItems();
    logger
      ..d('filters: ${widget.filters}')
      ..d('filteredItems: ${filteredItems.length}');

    if (widget.viewToShow == ListItemsPageView.listView) {
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
        listId: widget.list.id,
        items: sortedItems,
        onTap: showDetailsView,
      );
    } else {
      return FlutterMapsView(
        items: filteredItems,
        onTap: showDetailsView,
      );
      //  return GoogleMapsView(
      //   items: filteredItems,
      //   onTap: (itemId) => showDetailsView(userListId, itemId),
      // );
    }
  }

  void showDetailsView(String itemId) {
    showModalBottomSheet<ListItemInfoView>(
      context: context,
      builder: (context) => ListItemInfoView(listId: widget.list.id, itemId: itemId),
    );
  }

  List<AppBarAction<dynamic>> getAppBarActions() {
    final actions = [
      getShowListViewAction(),
      getShowSortAction(),
      getShowMapViewAction(),
      getShowFilterAction(),
      getShowShareListAction(),
      getShowEditAction(),
      getShowDeleteAction(),
      getShowImportAction(),
      getListAsSpreadsheetAction(),
    ].nonNulls.toList();

    return actions;
  }

  AppBarAction<AppBarActionIcon>? getShowListViewAction() {
    if (!shouldShowListOrMapAction()) {
      return null;
    }
    if (widget.viewToShow == ListItemsPageView.listView) {
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

  AppBarAction<dynamic>? getShowMapViewAction() {
    if (!shouldShowListOrMapAction()) {
      return null;
    }
    if (widget.viewToShow == ListItemsPageView.mapsView) {
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

  AppBarAction<dynamic>? getShowSortAction() {
    if (!shouldShowListOrMapAction()) {
      return null;
    }
    if (widget.viewToShow == ListItemsPageView.mapsView) {
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

  bool shouldShowListOrMapAction() {
    return widget.list.withMap;
  }

  AppBarAction<AppBarActionIcon>? getShowFilterAction() {
    return AppBarAction(
      type: AppBarActionType.icon,
      iconAction: AppBarActionIcon(
        title: context.l10n.filterMenuText,
        icon: widget.filters.anySelectedFilters(
          listHasDates: widget.list.withDates,
          listHasMap: widget.list.withMap,
        )
            ? Icons.filter_alt
            : Icons.filter_alt_outlined,
        callback: () {
          setState(() {
            showSideWidget = !showSideWidget;
          });
        },
        key: const Key('filterListItems'),
      ),
    );
  }

  AppBarAction<AppBarActionIcon>? getShowShareListAction() {
    return AppBarAction(
      type: AppBarActionType.icon,
      iconAction: AppBarActionIcon(
        title: context.l10n.shareListMenuText,
        icon: Icons.share,
        callback: () {
          ShareListPageRoute(widget.list.id!).push<void>(context);
        },
        key: const Key('shareListMenuItem'),
      ),
    );
  }

  AppBarAction<AppBarActionOverflowIcon>? getShowEditAction() {
    return AppBarAction(
      type: AppBarActionType.overflowIcon,
      overflowIcon: AppBarActionOverflowIcon(
        title: context.l10n.editList,
        icon: Icons.edit,
        callback: () async {
          final listBloc = context.read<ListLoadBloc>();
          await EditListPageRoute(widget.list.id!).push<void>(context);
          listBloc.add(LoadList(widget.list.id!));
        },
        key: const Key('editList'),
      ),
    );
  }

  AppBarAction<AppBarActionOverflowIcon>? getShowDeleteAction() {
    return AppBarAction(
      type: AppBarActionType.overflowIcon,
      overflowIcon: AppBarActionOverflowIcon(
        title: context.l10n.deleteList,
        icon: Icons.delete,
        callback: () async {
          context.read<ListCrudBloc>().add(DeleteList(widget.list.id!));
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
          await ImportCsvPageRoute(widget.list.id!).push<void>(context);
        },
        key: const Key('deleteList'),
      ),
    );
  }

  AppBarAction<dynamic> getListAsSpreadsheetAction() {
    return AppBarAction(
      type: AppBarActionType.overflowIcon,
      overflowIcon: AppBarActionOverflowIcon(
        title: context.l10n.listAsSpreadsheetsMenuItem,
        icon: Icons.list_alt,
        callback: () async {
          await ListAsSpreadsheetsPageRoute(widget.list.id!).push<void>(context);
        },
        key: const Key('listAsSpreadsheet'),
      ),
    );
  }

  List<ListItem> filterItems() {
    return filterListItems(
      allItems: widget.listItems,
      filters: widget.filters,
      listHasDates: widget.list.withDates,
      listHasMap: widget.list.withMap,
      distanceFilterCenter: (widget.currentLocation != null)
          ? LatLong(lat: widget.currentLocation!.latitude, lng: widget.currentLocation!.longitude)
          : null,
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
