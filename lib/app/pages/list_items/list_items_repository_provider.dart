import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firebase_firestore_extensions.dart';
import 'package:listanything/app/firebase/firestore_provider.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/lists/share_code_repository_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/base_repository.dart';
import 'package:listanything/app/widgets/standardWidgets/error_monitor.dart';
import 'package:rxdart/rxdart.dart';

final listItemsRepositoryProvider = StreamProvider.family<BaseRepository<ListItem>, String>((ref, shareCode) async* {
  final firestore = await ref.watch(firestoreProvider.future);
  final errorMonitor = ErrorMonitor.device();

  final shareCodeRepo = await ref.watch(shareCodeRepositoryProvider.future);
  yield* shareCodeRepo.retrieveItemStream(itemId: shareCode).switchMap(
    (list) {
      print('ListItem repository for listId: ${list.listId}');
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
    },
  );
});
