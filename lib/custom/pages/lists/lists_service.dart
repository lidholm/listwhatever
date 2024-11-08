import 'package:cloud_firestore/cloud_firestore.dart';

import '/custom/pages/lists/models/list_of_things.dart';
import '/standard/firebase/firestore_service.dart';

const String className = 'ListsService';

class ListsService extends FirestoreService {
  ListsService({super.userId});

  Future<CollectionReference<Map<String, dynamic>>> getCollection() async {
    const path = '/lists';
    //
    return firestore.collection(path);
  }

  Stream<List<ListOfThings>> getLists() async* {
    // //
    if (userId == null) {
      //
      yield* Stream.value([]);
      return;
    }
    final listsCollection = await getCollection();
    yield* listsCollection.snapshots().map((snapshot) {
      // //
      return snapshot.docs.map((doc) {
        return convertToListOfThings(doc.id, doc.data());
      }).toList();
    });
  }

  ListOfThings convertToListOfThings(String id, Map<String, dynamic> data) {
    final list = ListOfThings.fromJson(data);
    return list.copyWith(
      id: id,
      shareType:
          list.ownerId == userId ? ShareType.editor : list.sharedWith[userId]!,
    );
  }

  Future<ListOfThings> getList(String id) async {
    try {
      // //
      final listsCollection = await getCollection();
      final snapshot = await listsCollection.doc(id).get();
      return convertToListOfThings(snapshot.id, snapshot.data()!);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> addList(ListOfThings list) async {
    // //
    final listsCollection = await getCollection();
    final docId = listsCollection.doc().id;
    // //
    final listToSave = list.copyWith(id: docId, ownerId: userId);
    await listsCollection.doc(docId).set(listToSave.toJson());
    return docId;
  }

  Future<void> updateList(ListOfThings list) async {
    //
    final listsCollection = await getCollection();
    final doc = listsCollection.doc(list.id);
    //
    await doc.update(list.toJson());
    return;
  }

  Future<void> deleteList(String actualListId) async {
    // //
    final listsCollection = await getCollection();
    return listsCollection.doc(actualListId).delete();
  }

  Future<Map<String, Set<String>>> getCategoriesForList(String listId) async {
    if (userId == null) {
      //
      return Future.value({});
    }
    final itemsCollection =
        (await getCollection()).doc(listId).collection('items');

    // Get the documents from the collection
    final QuerySnapshot querySnapshot = await itemsCollection.get();

    final allCategories = querySnapshot.docs
        .map((doc) => doc['categories'] as Map<String, dynamic>?)
        .toList();
    final categoriesAndValues = <String, Set<String>>{};

    final nonNullCategories =
        allCategories.where((t) => t != null && t.isNotEmpty);

    for (final m in nonNullCategories) {
      for (final cat in m!.keys.map((e) => e.trim())) {
        if (!categoriesAndValues.containsKey(cat)) {
          categoriesAndValues[cat] = <String>{};
        }
        if (m[cat] != null) {
          for (final value in m[cat] as List<dynamic>) {
            categoriesAndValues[cat]!.add((value as String).trim());
          }
        }
      }
    }

    return categoriesAndValues;
  }
}
