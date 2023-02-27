import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/list_items/filter_list_items.dart';
import 'package:listanything/app/pages/list_items/filter_provider.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_provider.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/selected_list_provider.dart';
import 'package:tuple/tuple.dart';

final filteredListIemsProvider = FutureProvider<List<ListItem>>((ref) async {
  final listItems = await ref.watch(listItemsProvider.future);
  final filters = ref.watch(filterProvider);
  if (listItems == null || listItems.isEmpty) {
    return [];
  }

  return filterListItems(listItems, filters);
});

final filtededLIstItemsAndListProvider = FutureProvider<Tuple2<List<ListItem>, ListOfThings?>>((ref) async {
  final filteredListItems = await ref.watch(filteredListIemsProvider.future);
  final list = await ref.watch(selectedListProvider.future);
  return Tuple2(filteredListItems, list);
});
