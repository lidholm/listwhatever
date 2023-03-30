import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_repository_provider.dart';
import 'package:listanything/app/pages/lists/share_code_repository_provider.dart';
import 'package:rxdart/rxdart.dart';

final listItemsProvider = StreamProvider.family<List<ListItem>?, String>((ref, shareCode) async* {
  final shareCodeRepo = await ref.watch(shareCodeRepositoryProvider.future);
  final repo = await ref.watch(listItemsRepositoryProvider(shareCode).future);
  yield* shareCodeRepo.retrieveItemStream(itemId: shareCode).switchMap(
        (item) => repo.retrieveItemsStreamAtPath('${item.path}/items'),
      );
});
