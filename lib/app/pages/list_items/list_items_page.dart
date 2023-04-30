import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/navigation/routes/add_list_item_route.dart';
import 'package:listanything/app/navigation/routes/edit_list_item_route.dart';
import 'package:listanything/app/navigation/routes/edit_list_route.dart';
import 'package:listanything/app/navigation/routes/filter_page_route.dart';
import 'package:listanything/app/navigation/routes/list_item_details_page_route.dart';
import 'package:listanything/app/navigation/routes/routes.dart';
import 'package:listanything/app/navigation/routes/share_list_page_route.dart';
import 'package:listanything/app/pages/list_items/filter_provider.dart';
import 'package:listanything/app/pages/list_items/filtered_list_items_provider.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_list_view.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/list_repository_provider.dart';
import 'package:listanything/app/pages/maps_view.dart';
import 'package:listanything/app/widgets/standardWidgets/app_bar_action.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';
import 'package:listanything/app/widgets/standardWidgets/exception_widget.dart';
import 'package:listanything/app/widgets/standardWidgets/shimmer.dart';
import 'package:listanything/app/widgets/standardWidgets/shimmer_loading.dart';

class ListItemsPage extends ConsumerWidget {
  const ListItemsPage({
    required this.publicListId,
    super.key,
  });
  final String publicListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //print('ListItemsPage: getting items for $publicListId');
    return ref.watch(filteredListItemsAndListProvider(publicListId)).when(
          error: (e, st) => ExceptionWidget(e: e, st: st),
          loading: () {
            //print('ListItemsPage.Loading');
            return ListItemsPageInner(
              items: List.generate(
                5,
                (index) => const ListItem(
                  name: '',
                  categories: {},
                ),
              ),
              isLoading: true,
            );
          },
          data: (value) {
            //print('here22');
            final items = value.item1;
            final list = value.item2;
            //print('ListItemsPage.items: ${items.length}');
            //print('ListItemsPage.list: $list');
            return ListItemsPageInner(
              items: sortItems(list, items),
              isLoading: false,
              list: list,
            );
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

class ListItemsPageInner extends HookConsumerWidget {
  const ListItemsPageInner({
    required this.items,
    required this.isLoading,
    this.list,
    super.key,
  });
  final List<ListItem> items;
  final bool isLoading;
  final ListOfThings? list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filterProvider);
    final showingList = useState(true);
    final expandedPercentage = useState<double>(1);

    return CommonScaffold(
      title: list?.name ?? '',
      titleWidget: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: 1 - expandedPercentage.value,
        child: Text(list?.name ?? ''),
      ),
      actions: [
        if (list?.withMap ?? false)
          if (showingList.value)
            AppBarAction(
              key: const Key('showmap'),
              title: 'Show map',
              icon: Icons.map_outlined,
              callback: () => showingList.value = false,
              overflow: false,
            )
          else
            AppBarAction(
              key: const Key('showlist'),
              title: 'Show list',
              icon: Icons.list,
              callback: () => showingList.value = true,
              overflow: false,
            ),
        if (list?.isEditor ?? false)
          AppBarAction(
            key: const Key('newitem'),
            title: 'New item',
            icon: Icons.playlist_add_outlined,
            callback: () => addNewListItem(ref, context, list!.publicListId!),
            overflow: false,
          ),
        AppBarAction(
          key: const Key('showfilters'),
          title: 'Filter',
          icon: filters.anySelectedFilters(
            listHasDates: list?.withDates ?? false,
          )
              ? Icons.filter_alt
              : Icons.filter_alt_off,
          callback: () => filterPage(context, list!.publicListId!),
          overflow: false,
        ),
        if (list?.isEditor ?? false)
          AppBarAction(
            key: const Key('editlist'),
            title: 'Edit list',
            icon: Icons.edit,
            callback: () => editList(ref, context, list!.publicListId!),
            overflow: true,
          ),
        if (list?.isEditor ?? false)
          AppBarAction(
            key: const Key('sharelist'),
            title: 'Share list',
            icon: Icons.share,
            callback: () async {
              if (list!.shareCodeForEditor == null) {
                final newList = list!.copyWith(
                  shareCodeForEditor: getRandomString(16),
                  shareCodeForViewer: getRandomString(16),
                );
                final repo = await ref.read(listRepositoryProvider.future);
                await repo.updateItem(itemId: list!.id!, item: newList);
              }
              //ignore: use_build_context_synchronously
              await ShareListPageRoute(publicListId: list!.publicListId!)
                  .push<void>(context);
            }, // shareList(ref, context, list!),
            overflow: false,
          ),
      ],
      body: Shimmer(
        linearGradient: shimmerGradient,
        child: Padding(
          padding: EdgeInsets.zero,
          child: ShimmerLoading(
            isLoading: isLoading,
            child: showingList.value
                ? ListItemsListView(
                    isLoading: isLoading,
                    list: list,
                    filters: filters,
                    expandedPercentage: expandedPercentage,
                    items: items,
                  )
                : MapsView(
                    isLoading: isLoading,
                    list: list!,
                    items: items,
                  ),
          ),
        ),
      ),
    );
  }

  void editList(WidgetRef ref, BuildContext context, String publicListId) {
    EditListRoute(publicListId: publicListId).push<void>(context);
  }

  void editListItem(
    WidgetRef ref,
    BuildContext context,
    String publicListId,
    ListItem listItem,
  ) {
    EditListItemRoute(publicListId: publicListId, listItemId: listItem.id!)
        .push<void>(context);
  }

  void showListItemDetails(
    WidgetRef ref,
    BuildContext context,
    String publicListId,
    ListItem listItem,
  ) {
    ListItemDetailsPageRoute(
      publicListId: publicListId,
      listItemId: listItem.id!,
    ).push<void>(context);
  }

  void addNewListItem(
    WidgetRef ref,
    BuildContext context,
    String publicListId,
  ) {
    AddListItemRoute(publicListId: publicListId).push<void>(context);
  }

  void filterPage(BuildContext context, String publicListId) {
    FilterPageRoute(publicListId: publicListId).push<void>(context);
  }
}
