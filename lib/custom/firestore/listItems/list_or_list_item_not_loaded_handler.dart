import 'package:flutter/material.dart';
import 'package:listanything/custom/firestore/listItems/list_item_events/list_item_state.dart';
import 'package:listanything/custom/firestore/listItems/list_items.dart';
import 'package:listanything/custom/firestore/lists/lists.dart';

class ListOrListItemNotLoadedHandler {
  static Widget? handleListAndListItemsState(ListState listState, ListItemsState listItemsState) {
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

  static Widget? handleListAndListItemState(ListState listState, ListItemState listItemState) {
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

  static Widget? handleListsState(ListsState listsState) {
    return switch (listsState) {
      ListsError() => getErrorWidget(listsState.errorMessage),
      ListsInitial() => const Center(child: CircularProgressIndicator()),
      ListsLoading() => const Center(child: CircularProgressIndicator()),
      ListsOperationSuccess() => const Center(child: CircularProgressIndicator()),
      ListsLoaded() => null,
    };
  }

  static Widget? handleListState(ListState listState) {
    return switch (listState) {
      ListError() => getErrorWidget(listState.errorMessage),
      ListInitial() => const Center(child: CircularProgressIndicator()),
      ListLoading() => const Center(child: CircularProgressIndicator()),
      ListOperationSuccess() => const Center(child: CircularProgressIndicator()),
      ListLoaded() => null,
      ListDeleted() => Container(),
    };
  }

  static Widget? handleListItemsState(ListItemsState listItemsState) {
    return switch (listItemsState) {
      ListItemsError() => getErrorWidget(listItemsState.errorMessage),
      ListItemsInitial() => const Center(child: CircularProgressIndicator()),
      ListItemsLoading() => const Center(child: CircularProgressIndicator()),
      ListItemsOperationSuccess() => const Center(child: CircularProgressIndicator()),
      ListItemsLoaded() => null,
    };
  }

  static Widget? handleListItemState(ListItemState listItemState) {
    return switch (listItemState) {
      ListItemError() => getErrorWidget(listItemState.errorMessage),
      ListItemInitial() => const Center(child: CircularProgressIndicator()),
      ListItemLoading() => const Center(child: CircularProgressIndicator()),
      ListItemOperationSuccess() => const Center(child: CircularProgressIndicator()),
      ListItemDeleted() => const Center(child: CircularProgressIndicator()),
      ListItemLoaded() => null,
    };
  }

  static Widget getErrorWidget(String errorMessage) {
    return Center(child: Text(errorMessage));
  }
}
