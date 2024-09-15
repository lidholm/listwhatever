import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/custom/pages/lists/page/list_squares.dart';

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
    return Scaffold(
      appBar: CommonAppBar(
        title: context.l10n.listsHeader,
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

              return ListSquares(
                firebaseStorage: firebaseStorage,
                lists: lists,
                userListContext: userListContext,
              );
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
  }
}
