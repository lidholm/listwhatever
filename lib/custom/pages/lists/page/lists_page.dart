import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/custom/pages/lists/models/list_type.dart';
import 'package:listwhatever/custom/pages/lists/models/user_list.dart';
import 'package:listwhatever/standard/app/app.dart';
import 'package:listwhatever/standard/app/bloc/app_state.dart';
import 'package:listwhatever/standard/appUi/colors/app_colors.dart';

import '/custom/navigation/routes.dart';
import '/custom/pages/listItems/list_items_page_route.dart';
import '/custom/pages/listItems/list_or_list_item_not_loaded_handler.dart';
import '/custom/pages/lists/addList/add_list.dart';
import '/l10n/l10n.dart';
import '/standard/appUi/theme/app_theme.dart';
import '/standard/constants.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import '/standard/widgets/imageButton/image_button.dart';
import '../lists_load_events/lists_bloc.dart';
import '../lists_load_events/lists_event.dart';
import '../lists_load_events/lists_state.dart';

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
    final crossAxisCount = kIsWeb ? (MediaQuery.of(context).size.width / 360).floor() : 2;

    return Scaffold(
      appBar: CommonAppBar(
        title: context.l10n.listsHeader,
      ),
      body: BlocBuilder<ListsLoadBloc, ListsLoadState>(
        builder: (userListContext, userListState) {
          logger.d('userListState: $userListState');
          final userState = context.watch<AppBloc>().state;
          print('===============> user: $userState');
          final userListStateView = ListOrListItemNotLoadedHandler.handleUserListsState(userListState);
          if (userListStateView != null) {
            return userListStateView;
          }
          final lists = (userListState as ListsLoadLoaded).lists;

          // logger.d('lists: ${lists.length}');
          return Padding(
            padding: const EdgeInsets.all(16),
            child: CustomScrollView(
              slivers: [
                SliverGrid.count(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  crossAxisCount: crossAxisCount,
                  children: lists.map(
                    (list) {
                      return ImageButton<UserList>(
                        item: list,
                        image: list.listType.getImagePath(),
                        text: list.listName,
                        chipText: list.listType.readable(),
                        callback: (list) {
                          ListItemsPageRoute(listId: list.id!).push<void>(userListContext);
                        },
                        isLoading: false,
                        topRightIcon: list.isOwnList!
                            ? const Icon(
                                Icons.verified_user_outlined,
                                color: mainColor,
                              )
                            : const Icon(
                                Icons.supervised_user_circle,
                                color: AppColors.casablanca,
                              ),
                        topRightIconBorderColor:
                            list.isOwnList! ? const AppTheme().themeData.primaryColor : AppColors.casablanca,
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
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
