import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/list_items/filter_list_items.dart';
import 'package:listanything/app/pages/list_items/filter_provider.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_provider.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/lists_provider.dart';
import 'package:tuple/tuple.dart';

final filteredListIemsProvider = Provider.family<AsyncValue<List<ListItem>>, String>((ref, shareCode) {
  print('filteredListIemsProvider: here');
  final listItemsValue = ref.watch(listItemsProvider(shareCode));
  final filters = ref.watch(filterProvider);

  return listItemsValue.when(
    data: (listItems) {
      print('$shareCode: listItems: ${listItems?.length}');
      return AsyncValue.data(filterListItems(listItems ?? [], filters));
    },
    error: (e, st) {
      print('filteredListIemsProvider error: e');
      return AsyncValue.error(e, st);
    },
    loading: () {
      print('filteredListIemsProvider loading');
      return const AsyncValue.loading();
    },
  );
});

final filtededListItemsAndListProvider =
    Provider.family<AsyncValue<Tuple2<List<ListItem>, ListOfThings?>>, String>((ref, shareCode) {
  print('filtededListItemsAndListProvider: here');
  final filteredListItemsValue = ref.watch(filteredListIemsProvider(shareCode));
  final listValue = ref.watch(listProvider(shareCode));

  return filteredListItemsValue.when(
    data: (filteredListItems) {
      print('$shareCode: filteredListItemsValue: $filteredListItemsValue');
      return listValue.whenData((list) => Tuple2(filteredListItems, list));
    },
    error: AsyncValue.error,
    loading: AsyncValue.loading,
  );
});
