import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firebase_firestore_extensions.dart';
import 'package:listanything/app/firebase/firestore_provider.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/lists/public_list_id.dart';
import 'package:listanything/app/pages/lists/public_list_id_repository_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/base_repository.dart';
import 'package:listanything/app/widgets/standardWidgets/error_monitor.dart';
import 'package:rxdart/rxdart.dart';

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
  //print('ListItem repository for listId: ${list.listId}');
  return Stream.value(
    BaseRepositoryImpl<ListItem>(
      firestore,
      errorMonitor,
      firestore.listItems,
      firestore.listItem,
      {'userId': list.userId, 'listId': list.listId},
      (data, id) => ListItem.fromJson(data).copyWith(id: id),
      (listItem) => listItem.toJson(),
    ),
  );
}
