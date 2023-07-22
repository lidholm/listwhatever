import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '/app/custom/pages/list_items/list_item.dart';
import '/app/custom/pages/lists/public_list_id.dart';
import '/app/custom/pages/lists/public_list_id_repository_provider.dart';
import '/app/standard/firebase/firebase_firestore_extensions.dart';
import '/app/standard/firebase/firestore_provider.dart';
import '/app/standard/helpers/constants.dart';
import '/app/standard/widgets/base_repository.dart';
import '/app/standard/widgets/error_monitor.dart';

final listItemsRepositoryProvider =
    StreamProvider.family<BaseRepository<ListItem>, String>(
        (ref, publicListId) async* {
  final firestore = await ref.watch(firestoreProvider.future);
  final errorMonitor = ErrorMonitor.device();

  final publicListIdRepo =
      await ref.watch(publicListIdRepositoryProvider.future);
  yield* publicListIdRepo
      .retrieveItemStream(itemId: publicListId)
      .switchMap((list) {
    return getListItemRepository(firestore, errorMonitor, list);
  });
});

Stream<BaseRepositoryImpl<ListItem>> getListItemRepository(
  FirebaseFirestore firestore,
  ErrorMonitor errorMonitor,
  PublicListId list,
) {
  logger.d('ListItem repository for listId: ${list.listId}');
  return Stream.value(
    BaseRepositoryImpl<ListItem>(
      firestore,
      errorMonitor,
      firestore.listItems,
      firestore.listItem,
      {'userId': list.userId, 'listId': list.listId},
      (data, id) => ListItem.fromJson(data!).copyWith(id: id),
      (listItem) => listItem.toJson(),
    ),
  );
}
