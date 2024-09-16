import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/custom/pages/lists/page/list_list.dart';
import 'package:listwhatever/custom/pages/lists/page/list_tiles.dart';
import 'package:listwhatever/custom/pages/lists/page/list_type_cubit/list_type_cubit.dart';
import 'package:listwhatever/standard/widgets/appBar/app_bar_action.dart';
import 'package:listwhatever/standard/widgets/appBar/app_bar_action_icon.dart';

import '/custom/navigation/routes.dart';
import '/custom/pages/list_or_list_item_not_loaded_handler.dart';
import '/custom/pages/lists/addList/add_list_page_route.dart';
import '/custom/pages/lists/lists_load_events/lists_bloc.dart';
import '/custom/pages/lists/lists_load_events/lists_event.dart';
import '/custom/pages/lists/lists_load_events/lists_state.dart';
import '/l10n/l10n.dart';
import '/standard/constants.dart';
import '/standard/firebase/firestore/firebase_storage.dart';
import '/standard/widgets/appBar/common_app_bar.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListsLoadBloc>(context).add(WatchLists());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListTypeCubit, ListType>(
      builder: (listTypeContext, listType) {
        return Scaffold(
          appBar: CommonAppBar(
            title: context.l10n.listsHeader,
            actions: [
              if (listType == ListType.tiles)
                AppBarAction(
                  type: AppBarActionType.icon,
                  iconAction: AppBarActionIcon(
                    title: 'Show as list',
                    icon: Icons.list,
                    callback: () {
                      context.read<ListTypeCubit>().toggle();
                    },
                    key: const Key('show_list_as_list'),
                  ),
                ),
              if (listType == ListType.list)
                AppBarAction(
                  type: AppBarActionType.icon,
                  iconAction: AppBarActionIcon(
                    title: 'Show as tiles',
                    icon: Icons.square_outlined,
                    callback: () {
                      context.read<ListTypeCubit>().toggle();
                    },
                    key: const Key('show_list_as_tiles'),
                  ),
                ),
            ],
          ),
          body: BlocBuilder<ListsLoadBloc, ListsLoadState>(
            builder: (userListContext, userListState) {
              return FutureBuilder(
                future: getFirebaseStorage(),
                builder: (context, snapshot) {
                  final firebaseStorage = snapshot.data;
                  if (firebaseStorage == null) {
                    return Container();
                  }
                  logger.d('userListState: $userListState');
                  final userListStateView =
                      ListOrListItemNotLoadedHandler.handleUserListsState(
                    userListState,
                  );
                  if (userListStateView != null) {
                    return userListStateView;
                  }
                  final lists = (userListState as ListsLoadLoaded).lists;

                  print('listType: $listType');
                  if (listType == ListType.tiles) {
                    return ListTiles(
                      firebaseStorage: firebaseStorage,
                      lists: lists,
                      userListContext: userListContext,
                    );
                  } else {
                    return ListList(
                      firebaseStorage: firebaseStorage,
                      lists: lists,
                      userListContext: userListContext,
                    );
                  }
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              const AddListPageRoute().push<void>(context);
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
