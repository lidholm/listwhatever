import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_repository_provider.dart';
import 'package:listanything/app/pages/lists/public_list_id_repository_provider.dart';
import 'package:rxdart/rxdart.dart';

final listItemsProvider = StreamProvider.family<List<ListItem>?, String>((ref, publicListId) async* {
  final publicListIdRepo = await ref.watch(publicListIdRepositoryProvider.future);
  final listItemRepo = await ref.watch(listItemsRepositoryProvider(publicListId).future);
  yield* publicListIdRepo.retrieveItemStream(itemId: publicListId).switchMap(
        (item) => listItemRepo.retrieveItemsStreamAtPath('${item.path}/items'),
      );
});
