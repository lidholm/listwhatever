import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/list_items/filter_list_items.dart';
import 'package:listanything/app/pages/list_items/filter_provider.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_provider.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/selected_list_provider.dart';
import 'package:tuple/tuple.dart';

final filteredListIemsProvider = Provider<AsyncValue<List<ListItem>>>((ref) {
  final listItemsValue = ref.watch(listItemsProvider);
  final filters = ref.watch(filterProvider);

  return listItemsValue.whenData((listItems) => filterListItems(listItems ?? [], filters));
});

final filtededLIstItemsAndListProvider = Provider<AsyncValue<Tuple2<List<ListItem>, ListOfThings?>>>((ref) {
  final filteredListItemsValue = ref.watch(filteredListIemsProvider);
  final listValue = ref.watch(selectedListProvider);

  return filteredListItemsValue.when(
    data: (filteredListItems) =>
        listValue.whenData((list) => Tuple2(filteredListItems, const ListOfThings(name: '', type: ListType.other))),
    error: AsyncValue.error,
    loading: AsyncValue.loading,
  );
});
