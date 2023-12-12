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
    final path = '/users/$userId/lists';
    // logger.d('path: $path');
    return (await getFirestore()).collection(path);
  }

  Stream<List<ListOfThings>> getLists() async* {
    final listsCollection = await getCollection();
    yield* listsCollection.snapshots().map((snapshot) {
      // logger.d('snapshot.docs: ${snapshot.docs.length}');
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return ListOfThings.fromJson(data);
      }).toList();
    });
  }

  Future<ListOfThings> getList(String id) async {
    final listsCollection = await getCollection();
    final snapshot = await listsCollection.doc(id).get();
    final data = snapshot.data()!;
    return ListOfThings.fromJson(data);
  }

  Future<void> addList(ListOfThings list) async {
    final listsCollection = await getCollection();
    final docId=listsCollection.doc().id;
    return listsCollection.doc(docId).set(list.copyWith(id: docId).toJson());
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
