import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/pages/list_items/filter_list_items.dart';
import 'package:listanything/app/pages/list_items/filter_provider.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_provider.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/lists_provider.dart';
import 'package:tuple/tuple.dart';

final _filteredListItemsProvider = Provider.family<AsyncValue<List<ListItem>>, String>((ref, publicListId) {
  print('filteredListIemsProvider: here');
  final listItemsValue = ref.watch(listItemsProvider(publicListId));
  final listValue = ref.watch(listProvider(publicListId));
  final filters = ref.watch(filterProvider);

  return combineTwoAsyncValues(listItemsValue, listValue).when(
    loading: () {
      print('filteredListIemsProvider loading');
      return const AsyncValue.loading();
    },
    error: (e, st) {
      print('filteredListIemsProvider error: $e');
      print('filteredListIemsProvider error: $st');
      return AsyncValue.error(e, st);
    },
    data: (tuple) {
      final listItems = tuple.item1;
      final list = tuple.item2;
      print('$publicListId: listItems: ${listItems?.length}');
      return AsyncValue.data(
        filterListItems(
          allItems: listItems ?? [],
          filters: filters,
          listHasDates: list.withDates,
        ),
      );
    },
  );
});

final filteredListItemsAndListProvider =
    Provider.family<AsyncValue<Tuple2<List<ListItem>, ListOfThings?>>, String>((ref, publicListId) {
  print('filtededListItemsAndListProvider: here');
  final filteredListItemsValue = ref.watch(_filteredListItemsProvider(publicListId));
  final listValue = ref.watch(listProvider(publicListId));

  return filteredListItemsValue.when(
    data: (filteredListItems) {
      print('$publicListId: filteredListItemsValue: $filteredListItemsValue');
      return listValue.whenData((list) => Tuple2(filteredListItems, list));
    },
    error: (e, st) {
      print('filteredListIemsProvider error: $e');
      print('filteredListIemsProvider error: $st');
      return AsyncValue.error(e, st);
    },
    loading: AsyncValue.loading,
  );
});
