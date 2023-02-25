import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/navigation/routes/add_or_edit_list_item_route.dart';
import 'package:listanything/app/navigation/routes/add_or_edit_list_route.dart';
import 'package:listanything/app/navigation/routes/routes.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_provider.dart';
import 'package:listanything/app/pages/list_items/selected_list_item_provider.dart';
import 'package:listanything/app/pages/lists/selected_list_provider.dart';
import 'package:listanything/app/string_extensions.dart';
import 'package:listanything/app/widgets/standardWidgets/app_bar_action.dart';
import 'package:listanything/app/widgets/standardWidgets/async_value_widget.dart';
import 'package:listanything/app/widgets/standardWidgets/common_app_bar.dart';

class ListItemsPage extends ConsumerWidget {
  const ListItemsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listId = ref.watch(selectedListIdProvider);
    return AsyncValueWidget<List<ListItem>?>(
      value: ref.watch(listItemsProvider),
      data: (items) => Scaffold(
        appBar: CommonAppBar(
          title: 'Items',
          actions: [
            AppBarAction(
              title: 'New item',
              icon: Icons.playlist_add_outlined,
              callback: () => addNewList(ref, context),
              overflow: false,
            ),
            AppBarAction(
              title: 'Edit list',
              icon: Icons.edit,
              callback: () => editList(ref, context, listId!),
              overflow: true,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final item = items![index];
                    final categoriesToShow =
                        item.categories.entries.length > 4 ? item.categories.entries.take(3) : item.categories.entries;
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () => editListItem(ref, context, item),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent),
                          ),
                          height: 80,
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue[100],
                                  border: const Border(
                                    right: BorderSide(color: Colors.blueAccent),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                    child: SizedBox(
                                      width: 80,
                                      child: Text(
                                        item.name,
                                        style: const TextStyle(fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...categoriesToShow
                                        .map(
                                          (c) => Row(
                                            children: [
                                              Text(
                                                '${c.key.toCapitalized()}: ',
                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                              ),
                                              Text(
                                                c.value.join(', '),
                                                style: const TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        )
                                        .toList(),
                                    if (item.categories.entries.length > 4) const Text('...'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  // 40 list items
                  childCount: items!.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void editList(WidgetRef ref, BuildContext context, String listId) {
    ref.read(selectedListIdProvider.notifier).state = listId;
    const AddOrEditListRoute().push(context);
  }

  void editListItem(WidgetRef ref, BuildContext context, ListItem listItem) {
    ref.read(selectedListItemIdProvider.notifier).state = listItem.id;
    const AddOrEditListItemRoute().push(context);
  }

  Future<void> addNewList(WidgetRef ref, BuildContext context) async {
    const AddOrEditListItemRoute().push(context);
  }
}
