import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listwhatever/firestore/firestore.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';

class ListRepository {
  ListRepository();

  Future<CollectionReference<Map<String, dynamic>>> getCollection() async {
    const path = '/lists';
    print('ListRepository path: $path');
    return (await getFirestore()).collection(path);
  }

  Future<DocumentReference<Map<String, dynamic>>> getCollectionWithId(
    String listId,
  ) async {
    final path = '/lists/$listId';
    print('ListRepository path: $path');
    return (await getFirestore()).doc(path);
  }

  Future<ListOfThings> loadList(String listId) async {
    final listsCollection = await getCollectionWithId(listId);

    final snapshot = await listsCollection.get();
    final data = snapshot.data();
    return convertToUserList(snapshot.id, data!);
  }

  ListOfThings convertToUserList(String id, Map<String, dynamic> data) {
    final list = ListOfThings.fromJson(data);
    return list.copyWith(id: id);
  }

  Future<String> addList(ListOfThings list) async {
    final listsCollection = await getCollection();
    final ref = await listsCollection.add(list.toJson());
    return ref.id;
  }
}
