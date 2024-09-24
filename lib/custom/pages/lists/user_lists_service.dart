import 'package:cloud_firestore/cloud_firestore.dart';

import '/custom/pages/lists/models/user_list.dart';
import '/standard/constants.dart';
import '/standard/firebaseService/firebase_service.dart';

class UserListsService extends FirestoreService {
  UserListsService({super.userId});
  static String className = 'UserListsService';

  Future<CollectionReference<Map<String, dynamic>>> getCollection() async {
    final path = '/users/$userId/lists';
    logger.d('user lists path: $path');
    return firestore.collection(path);
  }

  Stream<List<UserList>> getUserLists() async* {
    logger.d('getting user lists');
    if (userId == null) {
      logger.d('no user yet');
      yield* Stream.value([]);
      return;
    }
    final listsCollection = await getCollection();
    yield* listsCollection.snapshots().map((snapshot) {
      logger.d('snapshot.docs: ${snapshot.docs.length}');
      return snapshot.docs.map((doc) {
        return convertToUserList(doc.id, doc.data());
      }).toList();
    });
  }

  UserList convertToUserList(String id, Map<String, dynamic> data) {
    logger.d('$className: convertToUserList $id $data');
    final tmp = UserList.fromJson(data);
    return tmp.copyWith(id: id, isOwnList: tmp.ownerId == userId);
  }

  Future<UserList> getUserList(String listId) async {
    logger.d('getting user list: $listId');
    final listsCollection = await getCollection();
    final snapshot = await listsCollection.doc(listId).get();
    final data = snapshot.data();
    logger.i('$className => user list data: $data');
    return convertToUserList(snapshot.id, data!);
  }

  Future<void> addList(UserList list) async {
    logger.d('adding user list: $list');
    final listsCollection = await getCollection();
    final docId = listsCollection.doc().id;
    logger.d('adding user list, docId: $docId');
    return listsCollection.doc(docId).set(list.copyWith(id: docId).toJson());
  }

  Future<void> updateList(UserList list) async {
    logger.d('updaing user list: $list');
    final listsCollection = await getCollection();
    return listsCollection.doc(list.id).update(list.toJson());
  }

  Future<void> deleteList(String listId) async {
    logger.d('deleting user list: $listId');

    final listsCollection = await getCollection();
    final querySnapshot =
        await listsCollection.where('actualListId', isEqualTo: listId).get();
    final documents = querySnapshot.docs;
    final document = documents.first;
    final docId = convertToUserList(document.id, document.data()).id;
    return listsCollection.doc(docId).delete();
  }
}
