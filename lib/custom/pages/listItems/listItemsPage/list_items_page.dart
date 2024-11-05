import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/custom/navigation/routes.dart';
import 'package:listwhatever/custom/pages/listItems/addListItem/edit_list_item_page_route.dart';
import 'package:listwhatever/custom/pages/listItems/filters/filter_widget.dart';
import 'package:listwhatever/custom/pages/listItems/filters/show_filter_cubit.dart';
import 'package:listwhatever/custom/pages/listItems/infoView/list_item_info_view.dart';
import 'package:listwhatever/custom/pages/listItems/listItemsListView/list_items_list_view.dart';
import 'package:listwhatever/custom/pages/listItems/listItemsPage/list_items_page_app_bar.dart';
import 'package:listwhatever/custom/pages/listItems/listItemsPage/list_items_page_view_cubit.dart';
import 'package:listwhatever/custom/pages/listItems/list_item_load_bloc/list_item_load_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/list_item_load_bloc/list_item_load_event.dart';
import 'package:listwhatever/custom/pages/listItems/map/flutter_maps_view.dart';
import 'package:listwhatever/standard/widgets/shimmer/shimmer.dart';
import 'package:listwhatever/standard/widgets/shimmer/shimmer_loading.dart';

import '/custom/pages/listItems/list_items_load_bloc/list_items_load_bloc.dart';
import '/custom/pages/listItems/list_items_load_bloc/list_items_load_event.dart';
import '/custom/pages/lists/list_load_events/list_load_bloc.dart';
import '/custom/pages/lists/list_load_events/list_load_event.dart';

const String className = 'ListItemsPage';

class ListItemsPage extends StatefulWidget {
  const ListItemsPage({required this.actualListId, super.key});

  final String actualListId;

  @override
  State<ListItemsPage> createState() => _ListItemsPageState();
}

class _ListItemsPageState extends State<ListItemsPage> {
  @override
  void initState() {
    // This might be better to call somewhere else. Not sure where though?
    BlocProvider.of<ListItemsLoadBloc>(context)
        .add(WatchListItems(widget.actualListId));
    BlocProvider.of<ListLoadBloc>(context).add(LoadList(widget.actualListId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewToShow = context.watch<ListItemsPageViewCubit>().state;

    return Builder(builder: (context) {
      return Scaffold(
        appBar:
            ListItemsPageAppBar(showFilterSideWidgetCallback: toggleShowFilter),
        body: Shimmer(
          linearGradient: shimmerGradient,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 10,
                child: viewToShow == ListItemsPageView.listView
                    ? ListItemsListView(
                        onTap: showDetailsView,
                        onEdit: onEdit,
                      )
                    : FlutterMapsView(
                        onTap: showDetailsView,
                      ),
              ),
              const FilterWidget(),
            ],
          ),
        ),
        // floatingActionButton: widget.list.shareType == ShareType.editor
        //     ? FloatingActionButton(
        //         onPressed: () {
        //           AddListItemPageRoute(widget.actualListId).push<void>(context);
        //         },
        //         child: const Icon(Icons.add),
        //       )
        //     : null,
      );
      // ignore: require_trailing_commas
    });
  }

  void toggleShowFilter() {
    context.read<ShowFilterCubit>().toggle();
  }

  Future<void> onEdit(String listItemId) async {
    final listItemBloc = context.read<ListItemLoadBloc>();
    await EditListItemPageRoute(widget.actualListId, listItemId)
        .push<void>(context);
    listItemBloc.add(LoadListItem(widget.actualListId, listItemId));
  }

  void showDetailsView(String itemId) {
    showModalBottomSheet<ListItemInfoView>(
      context: context,
      builder: (context) =>
          ListItemInfoView(actualListId: widget.actualListId, itemId: itemId),
    );
  }

  //     final listItemsState = context.watch<ListItemsLoadBloc>().state;
  //     final filtersState = context.watch<FilterBloc>().state;
  //     final currentLocation = context.watch<CurrentLocationCubit>().state;
  //     final appState = context.watch<AppBloc>().state;
  //     final viewToShow = context.watch<ListItemsPageViewCubit>().state;
  //     final listState = context.watch<ListLoadBloc>().state;

  //     final errorView = getErrorView(listState, listItemsState, filtersState);
  //     if (errorView != null) {
  //       return errorView;
  //     }

  //     if (appState is! LoggedInWithData) {
  //       return const Text('Not logged in or onboarded');
  //     }
  //     final user = appState.user;

  //     var filters = generateShimmerFilters();
  //     ListOfThings? list = generateShimmerList();
  //     var listItems = List.generate(6, (i) => generateShimmerListItem());

  //     if (!isLoading(filtersState, listState, listItemsState)) {
  //       filters = (filtersState as FiltersUpdated).filters;
  //       list = (listState as ListLoadLoaded).list;
  //       listItems = (listItemsState as ListItemsLoadLoaded).listItems;
  //       if (list == null) {
  //         return const Text('List is null');
  //       }
  //     }

  //     return BlocListener<ListCrudBloc, ListCrudState>(
  //       listener: (context, state) {
  //         logger.i('$className => state: $state');
  //         if (state is ListCrudDeleted) {
  //           logger.i('$className -> popping once');
  //           GoRouter.of(context).pop();
  //         }
  //       },
  //       child: InnerListItemsPage(
  //         user,
  //         list,
  //         listItems,
  //         filters,
  //         currentLocation,
  //         viewToShow,
  //       ),
  //     );
  //   },
  // );
  // }

  // bool isLoading(
  //   FilterState filtersState,
  //   ListLoadState listState,
  //   ListItemsLoadState listItemsState,
  // ) {
  //   switch (filtersState) {
  //     case UpdatingFilters():
  //       return true;
  //     case FiltersError():
  //       return true;
  //     case FiltersUpdated():
  //   }
  //   switch (listState) {
  //     case ListLoadInitial():
  //       return true;
  //     case ListLoadLoading():
  //       return true;
  //     case ListLoadError():
  //       return true;
  //     case ListLoadLoaded():
  //   }
  //   switch (listItemsState) {
  //     case ListItemsLoadInitial():
  //       return true;
  //     case ListItemsLoadLoading():
  //       return true;
  //     case ListItemsLoadError():
  //       return true;
  //     case ListItemsLoadLoaded():
  //   }
  //   return false;
  // }
}
