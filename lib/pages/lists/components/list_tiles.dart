import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/pages/lists/bloc/lists_bloc.dart';
import 'package:listwhatever/pages/lists/components/user_list_tile.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';

const String className = 'ListTiles';

class ListTiles extends StatelessWidget {
  const ListTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final listsState = context.watch<ListsBloc>().state;
    print('listsState: $listsState');

    final lists = getLists(listsState);
    final isLoading = isLoadingState(listsState);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        children: List.generate(lists.length, (index) {
          final list = lists[index];
          return UserListTile(
            list: list,
            isLoading: isLoading,
          );
        }),
      ),
    );
  }

  List<UserList> getLists(ListsState listsState) {
    if (isLoadingState(listsState)) {
      return List.generate(4, (i) => UserList.shimmerList());
    }

    return (listsState as ListsLoaded).lists;
  }

  bool isLoadingState(ListsState listsState) {
    return listsState is! ListsLoaded;
  }
}
