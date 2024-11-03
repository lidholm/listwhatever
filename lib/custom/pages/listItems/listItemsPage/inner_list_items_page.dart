import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:listwhatever/custom/pages/listItems/addListItem/edit_list_item_page_route.dart';
import 'package:listwhatever/custom/pages/listItems/list_item_load_bloc/list_item_load_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/list_item_load_bloc/list_item_load_event.dart';
import 'package:listwhatever/standard/firebase/firebase_storage.dart';
import 'package:listwhatever/standard/widgets/appBar/image_background_common_app_bar.dart';

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
import '/standard/userRepository/models/user.dart';
import '/standard/widgets/appBar/app_bar_action.dart';
import '/standard/widgets/appBar/app_bar_action_dropdown.dart';
import '/standard/widgets/appBar/app_bar_action_icon.dart';
import '/standard/widgets/appBar/app_bar_action_overflow_icon.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import 'list_items_page_view_cubit.dart';

const toolbarHeight = 140.0;

class InnerListItemsPage extends StatefulWidget {
  const InnerListItemsPage(
    this.user,
    this.list,
    this.listItems,
    this.filters,
    this.currentLocation,
    this.viewToShow, {
    super.key,
  });

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

  @override
  Widget build(BuildContext context) {
    final sortOrder = context.watch<ListItemsSortOrderCubit>().state;

    return Scaffold(
      appBar: getAppBar(widget.list, sortOrder),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 10,
            child: showLoadedItems(sortOrder),
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
      height: onRightHandSide
          ? MediaQuery.of(context).size.height
          : heightForBottomView,
      width: onRightHandSide
          ? widthForRightHandSideView
          : MediaQuery.of(context).size.width,
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

  Widget showLoadedItems((ListItemsSortOrder, SortOrder) sortOrder) {
    // logger
    //       ..d('=======================')
    //       ..d('number of items: ${widget.listItems.length}')
    // ..d('items: $listItems')
    // ..d('items:\n${listItems.map((i) => '${i.latLong} - ${i.name} ').join('\n')}');
    // ;
    final filteredItems = filterItems();
    // logger
    //   ..d('filters: ${widget.filters}')
    //   ..d('filteredItems: ${filteredItems.length}');

    if (widget.viewToShow == ListItemsPageView.listView) {
      final multiplier = sortOrder.$2 == SortOrder.ascending ? 1 : -1;
      final sortedItems = filteredItems
        ..sort(
          (a, b) => switch (sortOrder.$1) {
            ListItemsSortOrder.name => a.name.compareTo(b.name) * multiplier,
            ListItemsSortOrder.date =>
              (a.datetime ?? DateTime(1)).compareTo(b.datetime ?? DateTime(1)) *
                  multiplier,
            ListItemsSortOrder.distance =>
              a.name.compareTo(b.name) * multiplier,
          },
        );
      return ListItemsListView(
        actualListId: widget.list.id,
        items: sortedItems,
        onTap: showDetailsView,
        onEdit: (listItemId) async {
          final listItemBloc = context.read<ListItemLoadBloc>();
          await EditListItemPageRoute(widget.list.id!, listItemId)
              .push<void>(context);
          listItemBloc.add(LoadListItem(widget.list.id!, listItemId));
        },
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
      builder: (context) =>
          ListItemInfoView(actualListId: widget.list.id, itemId: itemId),
    );
  }

  List<AppBarAction<dynamic>> getAppBarActions(
    (ListItemsSortOrder, SortOrder) sortOrder,
    ListOfThings list,
  ) {
    final actions = [
      getShowListViewAction(),
      getShowSortAction(sortOrder, list),
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
        title: AppLocalizations.of(context).showAsList,
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
        title: AppLocalizations.of(context).showAsMap,
        icon: Icons.map,
        callback: () {
          context.read<ListItemsPageViewCubit>().toggle();
        },
        key: const Key('showMapsView'),
      ),
    );
  }

  AppBarAction<dynamic>? getShowSortAction(
    (ListItemsSortOrder, SortOrder) sortOrder,
    ListOfThings list,
  ) {
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
        tooltip: AppLocalizations.of(context).sortActionText,
        callback: (dynamic value) {
          context
              .read<ListItemsSortOrderCubit>()
              .select(value as ListItemsSortOrder);
          // logger.d('value: $value');
        },
        menuItems: [
          (
            ListItemsSortOrder.name,
            AppLocalizations.of(context).sortActionItemName
          ),
          if (list.withDates)
            (
              ListItemsSortOrder.date,
              AppLocalizations.of(context).sortActionItemDate
            ),
          if (list.withMap)
            (
              ListItemsSortOrder.distance,
              AppLocalizations.of(context).sortActionItemDistance
            ),
        ]
            .map(
              (a) => (
                a.$1,
                Row(
                  children: [
                    if (a.$1 == sortOrder.$1)
                      Icon(
                        sortOrder.$2 == SortOrder.ascending
                            ? Icons.arrow_downward
                            : Icons.arrow_upward,
                      ),
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
        title: AppLocalizations.of(context).filterMenuText,
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
        title: AppLocalizations.of(context).shareListMenuText,
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
        title: AppLocalizations.of(context).editList,
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
        title: AppLocalizations.of(context).deleteList,
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
        title: AppLocalizations.of(context).importListItems,
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
        title: AppLocalizations.of(context).listAsSpreadsheetsMenuItem,
        icon: Icons.list_alt,
        callback: () async {
          await ListAsSpreadsheetsPageRoute(widget.list.id!)
              .push<void>(context);
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
          ? LatLong(
              lat: widget.currentLocation!.latitude,
              lng: widget.currentLocation!.longitude,
            )
          : null,
    );
  }

  CommonAppBar getAppBar(
    ListOfThings list,
    (ListItemsSortOrder, SortOrder) sortOrder,
  ) {
    return CommonAppBar(
      toolbarHeight: toolbarHeight,
      title: AppLocalizations.of(context).listItemsHeader(widget.list.name),
      titleWidget: StreamBuilder(
        stream: getImageAppBar(widget.list),
        builder: (buildContext, snapshot) {
          return snapshot.data ?? getDefaultImageAppBar(widget.list.name);
        },
      ),
      actions: getAppBarActions(sortOrder, list),
    );
  }

  Stream<ImageBackgroundCommonAppBar?> getImageAppBar(
    ListOfThings list,
  ) async* {
    final title = list.name;

    yield null;

    // Wait for the future to complete
    final imageUrl = await (await getFirebaseStorage())
        .ref()
        .child('images')
        .child(list.imageFilename!)
        .getDownloadURL();

    // Emit the second widget once the future is done
    yield ImageBackgroundCommonAppBar(
      title: title,
      imageUrl: imageUrl,
      toolbarHeight: toolbarHeight,
    );
  }

  Widget getDefaultImageAppBar(String title) {
    return ImageBackgroundCommonAppBar(
      title: title,
      imageUrl: null,
      toolbarHeight: toolbarHeight,
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
