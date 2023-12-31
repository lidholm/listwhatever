import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listanything/custom/firestore/listItems/list_or_list_item_not_loaded_handler.dart';
import 'package:listanything/custom/firestore/lists/lists.dart';
import 'package:listanything/custom/firestore/lists/user_list.dart';
import 'package:listanything/custom/navigation/routes.dart';
import 'package:listanything/custom/pages/listItems/list_items_page_route.dart';
import 'package:listanything/custom/pages/lists/addList/add_list.dart';
import 'package:listanything/l10n/l10n.dart';
import 'package:listanything/standard/appUi/theme/app_theme.dart';
import 'package:listanything/standard/widgets/appBar/common_app_bar.dart';
import 'package:listanything/standard/widgets/imageButton/image_button.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  @override
  void initState() {
    BlocProvider.of<ListsBloc>(context).add(WatchLists());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = kIsWeb ? (MediaQuery
        .of(context)
        .size
        .width / 240).floor() : 2;

    return Scaffold(
      appBar: CommonAppBar(
        title: context.l10n.listsHeader,
      ),
      body: BlocBuilder<ListsBloc, ListsState>(
        builder: (userListContext, userListState) {
              final userListStateView = ListOrListItemNotLoadedHandler.handleUserListsState(userListState);
              if (userListStateView != null) {
                return userListStateView;
              }
              final lists = (userListState as ListsLoaded).lists;

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
                          return ImageButton<Object>(
                            item: list,
                            image:list.listType.getImagePath(),
                            text: list.listName,
                            callback: (list) {
                              if (list is UserList) {
                                ListItemsPageRoute(listId: list.id!).push<void>(userListContext);
                              }
                              else {
                                print('SHARED LIST CLICKED');
                              }
                            },
                            isLoading: false,
                            topRightIcon: list.isOwnList!
                                ? const Icon(
                              Icons.verified_user_outlined,
                              color: mainColor,
                            )
                                : const Icon(
                              Icons.supervised_user_circle,
                              color: mainColor,
                            ),
                            topRightIconBorderColor:
                            list.isOwnList! ? const AppTheme().themeData.primaryColor : Colors.brown,
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
