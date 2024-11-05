import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/filters/bloc/filter_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/filters/bloc/filter_state.dart';
import 'package:listwhatever/custom/pages/listItems/filters/filter_view.dart';
import 'package:listwhatever/custom/pages/listItems/filters/filters.dart';
import 'package:listwhatever/custom/pages/listItems/filters/show_filter_cubit.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_state.dart';
import 'package:listwhatever/custom/pages/lists/list_load_events/list_load_bloc.dart';
import 'package:listwhatever/custom/pages/lists/list_load_events/list_load_state.dart';
import 'package:listwhatever/standard/app/bloc/app_bloc.dart';
import 'package:listwhatever/standard/app/bloc/app_state.dart';
import 'package:listwhatever/standard/constants.dart';

const widthForRightHandSideView = 400.0;
const heightForBottomView = 400.0;

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final showFilter = context.watch<ShowFilterCubit>().state;

    final appState = context.watch<AppBloc>().state;
    final listState = context.watch<ListLoadBloc>().state;
    final listItemsState = context.watch<ListItemsLoadBloc>().state;
    final filtersState = context.watch<FilterBloc>().state;

    var isLoading = true;
    var list = generateShimmerList();
    var listItems = generateShimmerListItem(0);
    var filters = Filters();
    var user = generateShimmerUser();

    if (appState is LoggedInWithData &&
        listState is ListLoadLoaded &&
        listItemsState is ListItemsLoadLoaded &&
        filtersState is FiltersUpdated &&
        listState.list != null) {
      isLoading = false;
      list = listState.list!;
      listItems = listItemsState.listItems;
      filters = filtersState.filters;
      user = appState.user;

      listItems = listItemsState.listItems;
      // sort(sortOrder, filterItems(list,
      // , filters));
    }

    const onRightHandSide = kIsWeb;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      right: onRightHandSide
          ? showFilter
              ? 0
              : -widthForRightHandSideView
          : null,
      left: onRightHandSide ? null : 0,
      top: onRightHandSide
          ? 0
          : showFilter
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
              isLoading: isLoading,
              list: list,
              listItems: listItems,
              filters: filters,
              settings: user.settings,
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
