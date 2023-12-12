import 'package:app_ui/app_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listanything/custom/firestore/listItems/list_or_list_item_not_loaded_handler.dart';
import 'package:listanything/custom/firestore/lists/lists.dart';
import 'package:listanything/custom/navigation/routes.dart';
import 'package:listanything/custom/pages/listItems/list_items.dart';
import 'package:listanything/custom/pages/lists/addList/add_list.dart';
import 'package:listanything/l10n/l10n.dart';
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
    final crossAxisCount = kIsWeb ? (MediaQuery.of(context).size.width / 240).floor() : 2;

    return Scaffold(
      appBar: CommonAppBar(
        title: context.l10n.listsHeader,
      ),
      body: BlocBuilder<ListsBloc, ListsState>(
        builder: (context, state) {
          final listStateView = ListOrListItemNotLoadedHandler.handleListsState(state);
          if (listStateView != null) {
            return listStateView;
          }

          final lists = (state as ListsLoaded).lists;
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
                      return ImageButton<ListOfThings>(
                        item: list,
                        image: list.type.getImagePath(),
                        text: list.name,
                        callback: (list) => {
                          ListItemsPageRoute(listId: list.id!).push<void>(context),
                        }, //,selectList(context, list), TODO: Fix
                        isLoading: false,
                        topRightIcon: false // list.shared TODO: Fix
                            ? const Icon(
                                Icons.supervised_user_circle,
                                color: mainColor,
                              )
                            : const Icon(
                                Icons.verified_user_outlined,
                                color: mainColor,
                              ),
                        topRightIconBorderColor: false // list.shared  TODO: Fix
                            ? const AppTheme().themeData.secondaryHeaderColor
                            : const AppTheme().themeData.primaryColor,
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
