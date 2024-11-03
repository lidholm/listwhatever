import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:listwhatever/custom/pages/listItems/filters/bloc/filter_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/filters/bloc/filter_event.dart';
import 'package:listwhatever/custom/pages/listItems/route/list_items_page_route.dart';
import 'package:listwhatever/custom/pages/lists/page/list_list.dart';
import 'package:listwhatever/custom/pages/lists/page/list_tiles.dart';
import 'package:listwhatever/custom/pages/lists/page/list_type_cubit/list_type_cubit.dart';
import 'package:listwhatever/standard/navigation/view/nav_drawer.dart';
import 'package:listwhatever/standard/widgets/appBar/app_bar_action.dart';
import 'package:listwhatever/standard/widgets/appBar/app_bar_action_icon.dart';

import '/custom/navigation/routes.dart';
import '/custom/pages/list_or_list_item_not_loaded_handler.dart';
import '/custom/pages/lists/addList/add_list_page_route.dart';
import '/custom/pages/lists/lists_load_events/lists_bloc.dart';
import '/custom/pages/lists/lists_load_events/lists_event.dart';
import '/custom/pages/lists/lists_load_events/lists_state.dart';
import '/standard/firebase/firebase_storage.dart';
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
    final listsState = context.watch<ListsLoadBloc>().state;
    final listType = context.watch<ListTypeCubit>().state;

    final listsStateView =
        ListOrListItemNotLoadedHandler.handleUserListsState(listsState);
    if (listsStateView != null) {
      return listsStateView;
    }

    return Scaffold(
      drawer: const NavDrawer(),
      appBar: CommonAppBar(
        title: AppLocalizations.of(context).appTitle,
        actions: [
          if (listType == ListViewType.tiles)
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
          if (listType == ListViewType.list)
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
      body: FutureBuilder(
        future: getFirebaseStorage(),
        builder: (context, snapshot) {
          final firebaseStorage = snapshot.data;
          if (firebaseStorage == null) {
            return Container();
          }
          final lists = (listsState as ListsLoadLoaded).lists;

          if (listType == ListViewType.tiles) {
            return ListTiles(
              firebaseStorage: firebaseStorage,
              lists: lists,
              userListContext: context,
              onTap: (listId) => onTap(context, listId),
            );
          } else {
            return ListList(
              firebaseStorage: firebaseStorage,
              lists: lists,
              userListContext: context,
              onTap: (listId) => onTap(context, listId),
            );
          }
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

  void onTap(BuildContext context, String listId) {
    context.read<FilterBloc>().add(UpdateFiltersForSelectedList(listId));
    ListItemsPageRoute(actualListId: listId).push<void>(context);
  }
}
