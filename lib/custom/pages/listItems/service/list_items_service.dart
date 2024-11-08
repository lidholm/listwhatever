import 'package:cloud_firestore/cloud_firestore.dart';

import '/custom/pages/listItems/models/list_item.dart';
import '/standard/firebase/firestore_service.dart';

const className = 'ListItemsService';

class ListItemsService extends FirestoreService {
  ListItemsService({super.userId});

  Future<CollectionReference<Map<String, dynamic>>> getCollection(
    String actualListId,
  ) async {
    final path = '/lists/$actualListId/items';
    //
    return firestore.collection(path);
  }

  Stream<List<ListItem>> getListItems(String actualListId) async* {
    final itemsCollection = await getCollection(actualListId);

    yield* itemsCollection.snapshots().map((snapshot) {
      //
      return snapshot.docs.map((doc) {
        final data = doc.data();
        //
        try {
          final listItem = ListItem.fromJson(data);
          return listItem;
        } catch (e) {
          rethrow;
        }
      }).toList();
    });
  }

  Future<ListItem?> getListItem(String actualListId, String itemId) async {
    //
    final itemsCollection = await getCollection(actualListId);
    final snapshot = await itemsCollection.doc(itemId).get();
    final data = snapshot.data();
    if (data == null) {
      return null;
    }
    try {
      final listItem = ListItem.fromJson(data);
      return listItem;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addListItem(String actualListId, ListItem list) async {
    final itemsCollection = await getCollection(actualListId);
    final docId = itemsCollection.doc().id;

    final updatedListItem = list
        .copyWith(
          id: docId,
          latestUpdateUser: userId,
        )
        .toJson();

    return itemsCollection.doc(docId).set(updatedListItem);
  }

  Future<void> updateListItem(String actualListId, ListItem listItem) async {
    final itemsCollection = await getCollection(actualListId);

    final updatedListItem = listItem
        .copyWith(
          latestUpdateUser: userId,
        )
        .toJson();

    return itemsCollection.doc(listItem.id).update(updatedListItem);
  }

  Future<void> deleteListItem(String actualListId, String itemId) async {
    final itemsCollection = await getCollection(actualListId);
    return itemsCollection.doc(itemId).delete();
  }
}
