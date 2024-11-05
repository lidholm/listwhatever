import 'package:flutter/material.dart';
import '/custom/pages/listItems/list_items_load_bloc/list_items_load_state.dart';

import '/custom/pages/shareList/bloc/shared_list_state.dart';
import 'listItems/list_item_load_bloc/list_item_load_state.dart';
import 'lists/list_load_events/list_load_state.dart';
import 'lists/lists_load_events/lists_state.dart';

class ListOrListItemNotLoadedHandler {
  static Widget? handleListAndListItemsState(
    ListLoadState listState,
    ListItemsLoadState listItemsState,
  ) {
    final listView = handleListState(listState);
    if (listView != null) {
      return listView;
    }
    final listItemsView = handleListItemsState(listItemsState);
    if (listItemsView != null) {
      return listItemsView;
    }
    return null;
  }

  static Widget? handleListAndListItemsErrors(
    ListLoadState listState,
    ListItemsLoadState listItemsState,
  ) {
    final listView = handleListError(listState);
    if (listView != null) {
      return listView;
    }
    final listItemsView = handleListItemsError(listItemsState);
    if (listItemsView != null) {
      return listItemsView;
    }
    return null;
  }

  static Widget? handleListAndListItemState(
    ListLoadState listState,
    ListItemLoadState listItemState,
  ) {
    final listView = handleListState(listState);
    if (listView != null) {
      return listView;
    }
    final listItemView = handleListItemState(listItemState);
    if (listItemView != null) {
      return listItemView;
    }
    return null;
  }

  static Widget? handleUserListsState(ListsLoadState listsState) {
    return switch (listsState) {
      ListsLoadError() => getErrorWidget(listsState.errorMessage),
      ListsLoadInitial() => initialListsView(),
      ListsLoadLoading() => loadingListsView(),
      ListsLoadLoaded() => null,
    };
  }

  static Widget? handleListState(ListLoadState listState) {
    return switch (listState) {
      ListLoadError() => getErrorWidget(listState.errorMessage),
      ListLoadInitial() => initialListView(),
      ListLoadLoading() => loadingListView(),
      ListLoadLoaded() => null,
    };
  }

  static Widget? handleListError(ListLoadState listState) {
    return switch (listState) {
      ListLoadError() => getErrorWidget(listState.errorMessage),
      ListLoadInitial() => null,
      ListLoadLoading() => null,
      ListLoadLoaded() => null,
    };
  }

  static Widget? handleListItemsState(ListItemsLoadState listItemsState) {
    return switch (listItemsState) {
      ListItemsLoadError() => getErrorWidget(listItemsState.errorMessage),
      ListItemsLoadInitial() => circularProgressIndicatorView(),
      ListItemsLoadLoading() => circularProgressIndicatorView(),
      ListItemsLoadLoaded() => null,
    };
  }

  static Widget? handleListItemsError(ListItemsLoadState listItemsState) {
    return switch (listItemsState) {
      ListItemsLoadError() => getErrorWidget(listItemsState.errorMessage),
      ListItemsLoadInitial() => null,
      ListItemsLoadLoading() => null,
      ListItemsLoadLoaded() => null,
    };
  }

  static Widget? handleListItemState(ListItemLoadState listItemState) {
    return switch (listItemState) {
      ListItemLoadError() => getErrorWidget(listItemState.errorMessage),
      ListItemLoadInitial() => circularProgressIndicatorView(),
      ListItemLoadLoading() => circularProgressIndicatorView(),
      ListItemLoadLoaded() => null,
    };
  }

  static Widget? handleSharedListState(SharedListState listState) {
    return switch (listState) {
      SharedListError() => getErrorWidget(listState.errorMessage),
      SharedListInitial() => initialListView(),
      SharedListLoading() => loadingListView(),
      SharedListOperationSuccess() => circularProgressIndicatorView(),
      SharedListLoaded() => null,
    };
  }

  static Widget getErrorWidget(String errorMessage) {
    return Center(child: Text(errorMessage));
  }

  static Widget initialListView() {
    // TODO: This would be better as a shimmer
    return const Text('InitialView');
  }

  static Widget loadingListView() {
    return const Text('loadingListView');
  }

  static Widget initialListsView() {
    return const Text('initialListsView');
  }

  static Widget loadingListsView() {
    return const Text('loadingListsView');
  }

  static Widget circularProgressIndicatorView() {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
