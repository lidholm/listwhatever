import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_repository_provider.dart';
import 'package:tuple/tuple.dart';

final listItemProvider = StreamProvider.family<ListItem, Tuple2<String, String>>((ref, shareCodeAndListItemId) async* {
  final shareCode = shareCodeAndListItemId.item1;
  final listItemId = shareCodeAndListItemId.item2;
  final repo = await ref.watch(listItemsRepositoryProvider(shareCode).future);

  yield* repo.retrieveItemStream(itemId: listItemId);
});
