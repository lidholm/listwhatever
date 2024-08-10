import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '/custom/currentLocationBloc/current_location_bloc.dart';
import '/custom/pages/listItems/filters/bloc/filter_bloc.dart';
import '/custom/pages/listItems/filters/bloc/filter_state.dart';
import '/custom/pages/listItems/listItemsPage/inner_list_items_page.dart';
import '/custom/pages/listItems/listItemsPage/list_items_page_view_cubit.dart';
import '/custom/pages/listItems/list_items_load_bloc/list_items_load_bloc.dart';
import '/custom/pages/listItems/list_items_load_bloc/list_items_load_event.dart';
import '/custom/pages/listItems/list_items_load_bloc/list_items_load_state.dart';
import '/custom/pages/list_or_list_item_not_loaded_handler.dart';
import '/custom/pages/lists/list_crud_events/list_crud_bloc.dart';
import '/custom/pages/lists/list_crud_events/list_crud_state.dart';
import '/custom/pages/lists/list_load_events/list_load_bloc.dart';
import '/custom/pages/lists/list_load_events/list_load_event.dart';
import '/custom/pages/lists/list_load_events/list_load_state.dart';
import '/standard/app/bloc/app_bloc.dart';
import '/standard/app/bloc/app_state.dart';
import '/standard/constants.dart';

class ListItemsPage extends StatefulWidget {
  const ListItemsPage({required this.actualListId, super.key});

  final String actualListId;

  @override
  State<ListItemsPage> createState() => _ListItemsPageState();
}

class _ListItemsPageState extends State<ListItemsPage> {
  @override
  void initState() {
    BlocProvider.of<ListItemsLoadBloc>(context).add(WatchListItems(widget.actualListId));
    BlocProvider.of<ListLoadBloc>(context).add(LoadList(widget.actualListId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final listItemsState = context.watch<ListItemsLoadBloc>().state;
        final filtersState = context.watch<FilterBloc>().state;
        final currentLocation = context.watch<CurrentLocationCubit>().state;
        final appState = context.watch<AppBloc>().state;
        final viewToShow = context.watch<ListItemsPageViewCubit>().state;

        final listState = context.watch<ListLoadBloc>().state;

        final notLoadedView = getNotLoadedView(listState, listItemsState, filtersState);
        if (notLoadedView != null) {
          return notLoadedView;
        }

        if (appState is! LoggedInWithData) {
          return const Text('Not logged in or onboarded');
        }
        final user = appState.user;

        final filters = (filtersState as FiltersUpdated).filters;
        final list = (listState as ListLoadLoaded).list;
        final listItems = (listItemsState as ListItemsLoadLoaded).listItems;

        if (list == null) {
          return const Text('List is null');
        }

        return BlocListener<ListCrudBloc, ListCrudState>(
          listener: (context, state) {
            logger.i('$this => state: $state');
            if (state is ListCrudDeleted) {
              logger.i('$this -> popping once');
              GoRouter.of(context).pop();
            }
          },
          child: InnerListItemsPage(user, list, listItems, filters, currentLocation, viewToShow),
        );
      },
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
