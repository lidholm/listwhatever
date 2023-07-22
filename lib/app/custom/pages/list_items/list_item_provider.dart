import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import '/app/custom/pages/list_items/list_item.dart';
import '/app/custom/pages/list_items/list_items_repository_provider.dart';

final listItemProvider =
    StreamProvider.family<ListItem, Tuple2<String, String>>(
        (ref, publicListIdAndListItemId) async* {
  final publicListId = publicListIdAndListItemId.item1;
  final listItemId = publicListIdAndListItemId.item2;
  final repo =
      await ref.watch(listItemsRepositoryProvider(publicListId).future);

  yield* repo.retrieveItemStream(itemId: listItemId);
});
