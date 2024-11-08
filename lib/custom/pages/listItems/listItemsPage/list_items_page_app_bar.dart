import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/custom/navigation/routes.dart';
import 'package:listwhatever/custom/pages/import/csv/import_csv_page_route.dart';
import 'package:listwhatever/custom/pages/import/spreadsheet/list_as_spreadsheets_page_route.dart';
import 'package:listwhatever/custom/pages/listItems/listItemsListView/list_items_sort_order_cubit.dart';
import 'package:listwhatever/custom/pages/listItems/listItemsPage/list_items_page_view_cubit.dart';
import 'package:listwhatever/custom/pages/lists/addList/edit_list_page_route.dart';
import 'package:listwhatever/custom/pages/lists/list_crud_events/list_crud_bloc.dart';
import 'package:listwhatever/custom/pages/lists/list_crud_events/list_crud_event.dart';
import 'package:listwhatever/custom/pages/lists/list_load_events/list_load_bloc.dart';
import 'package:listwhatever/custom/pages/lists/list_load_events/list_load_event.dart';
import 'package:listwhatever/custom/pages/lists/list_load_events/list_load_state.dart';
import 'package:listwhatever/custom/pages/lists/models/list_of_things.dart';
import 'package:listwhatever/custom/pages/shareList/share_list_page_route.dart';
import 'package:listwhatever/l10n/l10n.dart';
import 'package:listwhatever/standard/widgets/appBar/app_bar_action.dart';
import 'package:listwhatever/standard/widgets/appBar/app_bar_action_dropdown.dart';
import 'package:listwhatever/standard/widgets/appBar/app_bar_action_icon.dart';
import 'package:listwhatever/standard/widgets/appBar/app_bar_action_overflow_icon.dart';
import 'package:listwhatever/standard/widgets/appBar/common_app_bar.dart';
import 'package:listwhatever/standard/widgets/shimmer/shimmer.dart';
import 'package:listwhatever/standard/widgets/shimmer/shimmer_loading.dart';

const toolbarHeight = 140.0;

class ListItemsPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ListItemsPageAppBar({
    required this.showFilterSideWidgetCallback,
    super.key,
  });

  final void Function() showFilterSideWidgetCallback;
  @override
  Widget build(BuildContext context) {
    final listState = context.watch<ListLoadBloc>().state;
    final viewToShow = context.watch<ListItemsPageViewCubit>().state;

    final sortOrder = context.watch<ListItemsSortOrderCubit>().state;

    return Shimmer(
      linearGradient: shimmerGradient,
      child: CommonAppBar(
        title: '',
        titleWidget: _buildTitleWidget(listState),
        actions: getAppBarActions(context, listState, sortOrder, viewToShow),
      ),
    );
  }

  Widget _buildTitleWidget(ListLoadState listState) {
    var isLoading = true;
    const ImageProvider<Object> image = AssetImage(
      'assets/images/background.webp',
    ); // TODO: Fix after generating images
    var titleWidget = <Widget>[];

    if (listState is ListLoadLoaded && listState.list != null) {
      isLoading = false;
      final list = listState.list!;
      titleWidget = [
        Text(
          list.name,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
      ];
    }

    return ShimmerLoading(
      isLoading: isLoading,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.7),
              BlendMode.lighten,
            ),
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleWidget,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeight);

  List<AppBarAction<dynamic>> getAppBarActions(
    BuildContext context,
    ListLoadState listState,
    (ListItemsSortOrder, SortOrder) sortOrder,
    ListItemsPageView viewToShow,
  ) {
    if (listState is! ListLoadLoaded) {
      return [];
    }

    final list = listState.list;
    if (list == null) {
      return [];
    }

    final actions = [
      getShowListViewAction(context, list, viewToShow),
      getShowSortAction(context, list, sortOrder, viewToShow),
      getShowMapViewAction(context, list, viewToShow),
      getShowFilterAction(context, list),
      getShowShareListAction(context, list),
      getShowEditAction(context, list),
      getShowDeleteAction(context, list),
      getShowImportAction(context, list),
      getListAsSpreadsheetAction(context, list),
    ].nonNulls.toList();

    return actions;
  }

  AppBarAction<AppBarActionIcon>? getShowListViewAction(
    BuildContext context,
    ListOfThings list,
    ListItemsPageView viewToShow,
  ) {
    if (!shouldShowListOrMapAction(list)) {
      return null;
    }
    if (viewToShow == ListItemsPageView.listView) {
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

  AppBarAction<dynamic>? getShowMapViewAction(
    BuildContext context,
    ListOfThings list,
    ListItemsPageView viewToShow,
  ) {
    if (!shouldShowListOrMapAction(list)) {
      return null;
    }
    if (viewToShow == ListItemsPageView.mapsView) {
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
    BuildContext context,
    ListOfThings list,
    (ListItemsSortOrder, SortOrder) sortOrder,
    ListItemsPageView viewToShow,
  ) {
    if (!shouldShowListOrMapAction(list)) {
      return null;
    }
    if (viewToShow == ListItemsPageView.mapsView) {
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
          //
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

  bool shouldShowListOrMapAction(ListOfThings list) {
    return list.withMap;
  }

  AppBarAction<AppBarActionIcon>? getShowFilterAction(
    BuildContext context,
    ListOfThings list,
  ) {
    return AppBarAction(
      type: AppBarActionType.icon,
      iconAction: AppBarActionIcon(
        title: AppLocalizations.of(context).filterMenuText,
        icon:
            // filters.anySelectedFilters(
            //   listHasDates: list.withDates,
            //   listHasMap: list.withMap,
            // )
            //     ?
            Icons.filter_alt
        // : Icons.filter_alt_outlined
        ,
        callback: showFilterSideWidgetCallback,
        key: const Key('filterListItems'),
      ),
    );
  }

  AppBarAction<AppBarActionIcon>? getShowShareListAction(
    BuildContext context,
    ListOfThings list,
  ) {
    return AppBarAction(
      type: AppBarActionType.icon,
      iconAction: AppBarActionIcon(
        title: AppLocalizations.of(context).shareListMenuText,
        icon: Icons.share,
        callback: () {
          ShareListPageRoute(list.id!).push<void>(context);
        },
        key: const Key('shareListMenuItem'),
      ),
    );
  }

  AppBarAction<AppBarActionOverflowIcon>? getShowEditAction(
    BuildContext context,
    ListOfThings list,
  ) {
    return AppBarAction(
      type: AppBarActionType.overflowIcon,
      overflowIcon: AppBarActionOverflowIcon(
        title: AppLocalizations.of(context).editList,
        icon: Icons.edit,
        callback: () async {
          final listBloc = context.read<ListLoadBloc>();
          await EditListPageRoute(list.id!).push<void>(context);
          listBloc.add(LoadList(list.id!));
        },
        key: const Key('editList'),
      ),
    );
  }

  AppBarAction<AppBarActionOverflowIcon>? getShowDeleteAction(
    BuildContext context,
    ListOfThings list,
  ) {
    return AppBarAction(
      type: AppBarActionType.overflowIcon,
      overflowIcon: AppBarActionOverflowIcon(
        title: AppLocalizations.of(context).deleteList,
        icon: Icons.delete,
        callback: () async {
          context.read<ListCrudBloc>().add(DeleteList(list.id!));
        },
        key: const Key('deleteList'),
      ),
    );
  }

  AppBarAction<dynamic> getShowImportAction(
    BuildContext context,
    ListOfThings list,
  ) {
    return AppBarAction(
      type: AppBarActionType.overflowIcon,
      overflowIcon: AppBarActionOverflowIcon(
        title: AppLocalizations.of(context).importListItems,
        icon: Icons.import_export,
        callback: () async {
          await ImportCsvPageRoute(list.id!).push<void>(context);
        },
        key: const Key('deleteList'),
      ),
    );
  }

  AppBarAction<dynamic> getListAsSpreadsheetAction(
    BuildContext context,
    ListOfThings list,
  ) {
    return AppBarAction(
      type: AppBarActionType.overflowIcon,
      overflowIcon: AppBarActionOverflowIcon(
        title: AppLocalizations.of(context).listAsSpreadsheetsMenuItem,
        icon: Icons.list_alt,
        callback: () async {
          await ListAsSpreadsheetsPageRoute(list.id!).push<void>(context);
        },
        key: const Key('listAsSpreadsheet'),
      ),
    );
  }
}

//   CommonAppBar getAppBar(
//     ListOfThings list,
//     (ListItemsSortOrder, SortOrder) sortOrder,
//   ) {
//     return CommonAppBar(
//       toolbarHeight: toolbarHeight,
//       title: AppLocalizations.of(context).listItemsHeader(widget.list.name),
//       titleWidget: StreamBuilder(
//         stream: getImageAppBar(widget.list),
//         builder: (buildContext, snapshot) {
//           return snapshot.data ?? getDefaultImageAppBar(widget.list.name);
//         },
//       ),
//       actions: getAppBarActions(sortOrder, list),
//     );
//   }

//   Stream<ImageBackgroundCommonAppBar?> getImageAppBar(
//     ListOfThings list,
//   ) async* {
//     final title = list.name;

//     yield null;

//     // Wait for the future to complete
//     final imageUrl = await (await getFirebaseStorage())
//         .ref()
//         .child('images')
//         .child(list.imageFilename!)
//         .getDownloadURL();

//     // Emit the second widget once the future is done
//     yield ImageBackgroundCommonAppBar(
//       title: title,
//       imageUrl: imageUrl,
//       toolbarHeight: toolbarHeight,
//     );
//   }

//   Widget getDefaultImageAppBar(String title) {
//     return ImageBackgroundCommonAppBar(
//       title: title,
//       imageUrl: null,
//       toolbarHeight: toolbarHeight,
//     );
//   }
// }
