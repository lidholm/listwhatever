import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_repository_provider.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/lists_provider.dart';
import 'package:listanything/app/pages/lists/public_list_id_repository_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

final listAndListItemsProvider =
    StreamProvider.family<Tuple2<ListOfThings, List<ListItem>?>, String>((ref, publicListId) async* {
  final list = await ref.watch(listProvider(publicListId).future);
  final publicListIdRepo = await ref.watch(publicListIdRepositoryProvider.future);
  final listItemRepo = await ref.watch(listItemsRepositoryProvider(publicListId).future);
  yield* publicListIdRepo.retrieveItemStream(itemId: publicListId).switchMap(
        (item) => listItemRepo.retrieveItemsStreamAtPath('${item.path}/items').map((l) => Tuple2(list, l)),
      );
});
