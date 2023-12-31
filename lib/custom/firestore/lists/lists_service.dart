import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listanything/standard/firebase/firestore/firestore.dart';

import 'list_of_things.dart';

class ListsService {
  ListsService({required this.userId});

  String? userId;

  // ignore: use_setters_to_change_properties
  void changeUser(String? userId) {
    this.userId = userId;
  }

  Future<CollectionReference<Map<String, dynamic>>> getCollection() async {
    const path = '/lists';
    // logger.d('path: $path');
    return (await getFirestore()).collection(path);
  }

  Stream<List<ListOfThings>> getLists() async* {
    final listsCollection = await getCollection();
    yield* listsCollection.snapshots().map((snapshot) {
      // logger.d('snapshot.docs: ${snapshot.docs.length}');
      return snapshot.docs.map((doc) {
        return convertToListOfThings(doc.id, doc.data());
      }).toList();
    });
  }

  ListOfThings convertToListOfThings(String id, Map<String, dynamic> data) {
    final list = ListOfThings.fromJson(data);
    return list.copyWith(
      id: id,
      shareType: list.ownerId == userId ? ShareType.editor : list.sharedWith[userId]!,
      isOwnList: list.ownerId == userId,
    );
  }

  Future<ListOfThings> getList(String id) async {
    final listsCollection = await getCollection();
    final snapshot = await listsCollection.doc(id).get();
    return convertToListOfThings(snapshot.id, snapshot.data()!);
  }

  Future<String> addList(ListOfThings list) async {
    final listsCollection = await getCollection();
    final docId = listsCollection.doc().id;
    await listsCollection.doc(docId).set(list.copyWith(id: docId, ownerId: userId).toJson());
    return docId;
  }

  Future<void> updateList(ListOfThings list) async {
    final listsCollection = await getCollection();
    return listsCollection.doc(list.id).update(list.toJson());
  }

  Future<void> deleteList(String listId) async {
    final listsCollection = await getCollection();
    return listsCollection.doc(listId).delete();
  }
}
