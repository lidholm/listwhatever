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

  // Stream<List<UserList>> loadList() async* {
  //   if (userId == null || userId == anonymousId) {
  //     yield [];
  //     return;
  //   }

  //   final listsCollection = await getCollection();

  //   yield* listsCollection.snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       return convertToUserList(doc.id, doc.data());
  //     }).toList();
  //   });
  // }

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
