// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listanything/app/firebase/firebase_firestore_extensions.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/widgets/standardWidgets/custom_exception.dart';
import 'package:listanything/app/widgets/standardWidgets/error_monitor.dart';

abstract class BaseListItemsRepository {
  Stream<List<ListItem>> retrieveListItemsStream();
  Stream<ListItem> retrieveListItemStream({required String listItemId});
  Future<String> createListItem({required ListItem listItem});
  Future<String> updateListItem({required ListItem listItem});
  // Future<void> deleteItem({required SimpleTodoItem itemId});
}

class ListItemsRepository implements BaseListItemsRepository {
  ListItemsRepository(this.firestore, this.errorMonitor, this.userId, this.listId);

  final ErrorMonitor errorMonitor;
  final FirebaseFirestore firestore;
  final String? userId;
  final String? listId;

  @override
  Stream<List<ListItem>> retrieveListItemsStream() async* {
    try {
      if (userId == null || listId == null) {
        yield* Stream.value([]);
      }

      final query = firestore.listItems(userId!, listId!);
      yield* query.snapshots().map(convertCollection);
    } on FirebaseException catch (e, s) {
      await errorMonitor.recordError(e, s, 'as an example of non-fatal error');
      throw CustomException(message: e.message);
    }
  }

  @override
  Stream<ListItem> retrieveListItemStream({required String listItemId}) async* {
    if (userId == null || listId == null) throw const CustomException(message: 'User is not logged in');

    try {
      final query = firestore.listItem(userId!, listId!, listItemId);
      yield* query.snapshots().map(convertDocument);
    } on FirebaseException catch (e, s) {
      await errorMonitor.recordError(e, s, 'as an example of non-fatal error');
      throw CustomException(message: e.message);
    }
  }

  ListItem convertDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    try {
      final item = ListItem.fromJson(doc.data()!).copyWith(id: doc.id);
      return item;
    } on FirebaseException catch (e, s) {
      // ignore: flutter_style_todos, todo
      //TODO: Should be await
      errorMonitor.recordError(e, s, 'as an example of non-fatal error');
      throw CustomException(message: e.message);
    }
  }

  List<ListItem> convertCollection(QuerySnapshot<Map<String, dynamic>> list) {
    try {
      final items = list.docs.map((d) {
        final item = ListItem.fromJson(d.data()).copyWith(id: d.id);
        return item;
      }).toList();
      print('items: $items');
      return items;
    } on FirebaseException catch (e, s) {
      // ignore: flutter_style_todos, todo
      //TODO: Should be await
      errorMonitor.recordError(e, s, 'as an example of non-fatal error');
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<String> createListItem({required ListItem listItem}) async {
    if (userId == null || listId == null) throw const CustomException(message: 'User is not logged in');

    try {
      final data = listItem.toJson();
      print('data: $data');
      final ref = await firestore.listItems(userId!, listId!).add(data);
      return ref.id;
    } on FirebaseException catch (e, s) {
      await errorMonitor.recordError(e, s, 'as an example of non-fatal error');
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<String> updateListItem({required ListItem listItem}) async {
    if (userId == null || listId == null) throw const CustomException(message: 'User is not logged in');

    try {
      await firestore.listItem(userId!, listId!, listItem.id!).update(listItem.toJson());
      return listItem.id!;
    } on FirebaseException catch (e, s) {
      await errorMonitor.recordError(e, s, 'as an example of non-fatal error');
      throw CustomException(message: e.message);
    }
  }

  // @override
  // Future<void> deleteItem({required String itemId}) async {
  //   try {
  //     await firestore.mapWithListRef(user!.uid, mapType!.id!).doc(itemId).delete();
  //   } on FirebaseException catch (e, s) {
  //     await firebaseCrashlytics.recordError(e, s, reason: 'as an example of non-fatal error');
  //     throw CustomException(message: e.message);
  //   }
  // }
}
