import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/navigation/routes/add_or_edit_list_item_route.dart';
import 'package:listanything/app/navigation/routes/add_or_edit_list_route.dart';
import 'package:listanything/app/navigation/routes/filter_page_route.dart';
import 'package:listanything/app/navigation/routes/routes.dart';
import 'package:listanything/app/pages/list_items/filter_provider.dart';
import 'package:listanything/app/pages/list_items/filtered_list_items_provider.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_item_item.dart';
import 'package:listanything/app/pages/list_items/selected_list_item_provider.dart';
import 'package:listanything/app/pages/lists/selected_list_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/app_bar_action.dart';
import 'package:listanything/app/widgets/standardWidgets/common_app_bar.dart';
import 'package:listanything/app/widgets/standardWidgets/exception_widget.dart';
import 'package:listanything/app/widgets/standardWidgets/shimmer.dart';
import 'package:listanything/app/widgets/standardWidgets/shimmer_loading.dart';

class ListItemsPage extends ConsumerWidget {
  const ListItemsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(filteredListIemsProvider).when(
          error: (e, st) => ExceptionWidget(e: e, st: st),
          loading: () => ListItemsPageInner(
            items: List.generate(5, (index) => ListItem(name: '', categories: {})),
            isLoading: true,
          ),
          data: (items) => ListItemsPageInner(items: items, isLoading: false),
        );
  }
}

class ListItemsPageInner extends ConsumerWidget {
  const ListItemsPageInner({super.key, required this.items, required this.isLoading});
  final List<ListItem> items;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listId = ref.watch(selectedListIdProvider);
    final hasFilters = ref.watch(filterProvider).values.expand((e) => e).isNotEmpty;
    return Scaffold(
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
            title: 'Filter',
            icon: hasFilters ? Icons.filter_alt : Icons.filter_alt_off,
            callback: () => filterPage(context),
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
      body: Shimmer(
        linearGradient: shimmerGradient,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final item = items[index];

                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () => editListItem(ref, context, item),
                        child: ListItemItem(item: item, isLoading: isLoading),
                      ),
                    );
                  },
                  // 40 list items
                  childCount: items.length,
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
    ref.read(selectedListItemIdProvider.notifier).state = null;
    const AddOrEditListItemRoute().push(context);
  }

  Future<void> filterPage(BuildContext context) async {
    const FilterPageRoute().push(context);
  }
}
