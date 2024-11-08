import 'package:cloud_firestore/cloud_firestore.dart';

import '/custom/pages/lists/models/user_list.dart';
import '../../../standard/firebase/firestore_service.dart';

const String className = 'UserListsService';

class UserListsService extends FirestoreService {
  UserListsService({super.userId});

  Future<CollectionReference<Map<String, dynamic>>> getCollection() async {
    final path = '/users/$userId/lists';
    // //
    return firestore.collection(path);
  }

  Stream<List<UserList>> getUserLists() async* {
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
        return convertToUserList(doc.id, doc.data());
      }).toList();
    });
  }

  UserList convertToUserList(String id, Map<String, dynamic> data) {
    // //
    final tmp = UserList.fromJson(data);
    return tmp.copyWith(id: id, isOwnList: tmp.ownerId == userId);
  }

  Future<UserList> getUserList(String listId) async {
    // //
    final listsCollection = await getCollection();
    final snapshot = await listsCollection.doc(listId).get();
    final data = snapshot.data();
    //
    return convertToUserList(snapshot.id, data!);
  }

  Future<void> addList(UserList list) async {
    // //
    final listsCollection = await getCollection();
    final docId = listsCollection.doc().id;
    // //
    return listsCollection.doc(docId).set(list.copyWith(id: docId).toJson());
  }

  Future<void> updateList(UserList list) async {
    //
    final listsCollection = await getCollection();
    final doc = listsCollection.doc(list.id);
    //

    await doc.update(list.toJson());
    return;
  }

  Future<void> deleteList(String listId) async {
    // //

    final listsCollection = await getCollection();
    final querySnapshot =
        await listsCollection.where('actualListId', isEqualTo: listId).get();
    final documents = querySnapshot.docs;
    final document = documents.first;
    final docId = convertToUserList(document.id, document.data()).id;
    return listsCollection.doc(docId).delete();
  }
}
