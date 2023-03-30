import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/navigation/routes/add_list_item_route.dart';
import 'package:listanything/app/navigation/routes/edit_list_item_route.dart';
import 'package:listanything/app/navigation/routes/edit_list_route.dart';
import 'package:listanything/app/navigation/routes/filter_page_route.dart';
import 'package:listanything/app/navigation/routes/maps_page_route.dart';
import 'package:listanything/app/navigation/routes/routes.dart';
import 'package:listanything/app/navigation/routes/search_location_for_add_page_route.dart';
import 'package:listanything/app/pages/list_items/filter_provider.dart';
import 'package:listanything/app/pages/list_items/filtered_list_items_provider.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_item_item.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/widgets/standardWidgets/app_bar_action.dart';
import 'package:listanything/app/widgets/standardWidgets/common_app_bar.dart';
import 'package:listanything/app/widgets/standardWidgets/exception_widget.dart';
import 'package:listanything/app/widgets/standardWidgets/shimmer.dart';
import 'package:listanything/app/widgets/standardWidgets/shimmer_loading.dart';

class ListItemsPage extends ConsumerWidget {
  const ListItemsPage({super.key, required this.shareCode});
  final String shareCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('ListItemsPage: getting items for $shareCode');
    return ref.watch(filtededListItemsAndListProvider(shareCode)).when(
          error: (e, st) => ExceptionWidget(e: e, st: st),
          loading: () {
            print('Loading ListItemsPage');
            return ListItemsPageInner(
              items: List.generate(5, (index) => const ListItem(name: '', categories: {})),
              isLoading: true,
            );
          },
          data: (value) {
            print('here22');
            final items = value.item1;
            final list = value.item2;
            print('ListItemsPage.items: ${items.length}');
            print('ListItemsPage.list: $list');
            return ListItemsPageInner(items: sortItems(list, items), isLoading: false, list: list);
          },
        );
  }

  List<ListItem> sortItems(ListOfThings? list, List<ListItem> items) {
    if (list?.withDates ?? false) {
      return items.sortedBy((item) => item.datetime ?? DateTime.now()).toList();
    }
    return items.sortedBy((item) => item.name).toList();
  }
}

class ListItemsPageInner extends ConsumerWidget {
  const ListItemsPageInner({super.key, required this.items, required this.isLoading, this.list});
  final List<ListItem> items;
  final bool isLoading;
  final ListOfThings? list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasFilters = ref.watch(filterProvider).values.expand((e) => e).isNotEmpty;
    print('ListItemsPageInner.isLoading: $isLoading');
    print('ListItemsPageInner.list: $list');
    print('ListItemsPageInner.items: ${items.length}');
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Items - ${list?.name ?? 'Loading'}',
        actions: [
          if (list?.withMap ?? false)
            AppBarAction(
              title: 'Show map',
              icon: Icons.map_outlined,
              callback: () => showMap(ref, context, list!.id!),
              overflow: false,
            ),
          AppBarAction(
            title: 'New item',
            icon: Icons.playlist_add_outlined,
            callback: () => addNewListItem(ref, context, list!.shareCode!),
            overflow: false,
          ),
          AppBarAction(
            title: 'Filter',
            icon: hasFilters ? Icons.filter_alt : Icons.filter_alt_off,
            callback: () => filterPage(context, list!.shareCode!),
            overflow: false,
          ),
          AppBarAction(
            title: 'Edit list',
            icon: Icons.edit,
            callback: () => editList(ref, context, list!.shareCode!),
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
                        onTap: () => editListItem(ref, context, list!.shareCode!, item),
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

  void editList(WidgetRef ref, BuildContext context, String shareCode) {
    EditListRoute(shareCode: shareCode).push(context);
  }

  void editListItem(WidgetRef ref, BuildContext context, String shareCode, ListItem listItem) {
    EditListItemRoute(shareCode: shareCode, listItemId: listItem.id).push(context);
  }

  void addNewListItem(WidgetRef ref, BuildContext context, String shareCode) {
    print('list: $list');
    if (list?.withMap ?? false) {
      print('Routing to SearchLocationPageRoute');
      AddListItemRoute(shareCode: shareCode).push(context);
      SearchLocationForAddPageRoute(shareCode: list!.shareCode!).push(context);
    } else {
      print('Routing to AddOrEditListItemRoute');
      AddListItemRoute(shareCode: shareCode).push(context);
    }
  }

  void filterPage(BuildContext context, String shareCode) {
    FilterPageRoute(shareCode: shareCode).push(context);
  }

  void showMap(WidgetRef ref, BuildContext context, String shareCode) {
    MapsPageRoute(shareCode: shareCode).push(context);
  }
}
