import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/custom/navigation/routes.dart';
import '/custom/pages/listItems/route/list_items_page_route.dart';
import '/custom/pages/list_or_list_item_not_loaded_handler.dart';
import '/custom/pages/lists/addList/add_list_page_route.dart';
import '/custom/pages/lists/lists_load_events/lists_bloc.dart';
import '/custom/pages/lists/lists_load_events/lists_event.dart';
import '/custom/pages/lists/lists_load_events/lists_state.dart';
import '/custom/pages/lists/models/list_type.dart';
import '/custom/pages/lists/models/user_list.dart';
import '/l10n/l10n.dart';
import '/standard/appUi/colors/app_colors.dart';
import '/standard/appUi/theme/app_theme.dart';
import '/standard/constants.dart';
import '/standard/firebase/firestore/firebase_storage.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import '/standard/widgets/imageButton/image_button.dart';

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
          return FutureBuilder(
            future: getFirebaseStorage(),
            builder: (context, snapshot) {
              final firebaseStorage = snapshot.data;
              if (firebaseStorage == null) {
                return Container();
              }
              logger.d('userListState: $userListState');
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
                          final imageUrlFuture =
                              firebaseStorage.ref().child('images').child(list.imageFilename).getDownloadURL();
                          return FutureBuilder(
                            future: imageUrlFuture,
                            builder: (context, snapshot) {
                              final imageUrl = snapshot.data;
                              logger.i('$this => imageUrl: $imageUrl');
                              return ImageButton<UserList>(
                                item: list,
                                imageUrl: imageUrl ?? '',
                                text: list.listName,
                                chipText: list.listType.readable(),
                                callback: (list) {
                                  ListItemsPageRoute(actualListId: list.actualListId).push<void>(userListContext);
                                },
                                isLoading: imageUrl == null,
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
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
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
