import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/list_items/filter_list_items.dart';
import 'package:listanything/app/pages/list_items/filter_provider.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_provider.dart';

final filteredListIemsProvider = FutureProvider<List<ListItem>>((ref) async {
  final listItems = await ref.watch(listItemsProvider.future);
  final filters = ref.watch(filterProvider);
  if (listItems == null || listItems.isEmpty) {
    return [];
  }

  return filterListItems(listItems, filters);
});
