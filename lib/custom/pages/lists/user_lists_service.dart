import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listwhatever/standard/helpers/logger_helper.dart';

import '/custom/pages/lists/models/user_list.dart';
import '../../../standard/firebase/firestore_service.dart';

const String className = 'UserListsService';

class UserListsService extends FirestoreService {
  UserListsService({super.userId});

  Future<CollectionReference<Map<String, dynamic>>> getCollection() async {
    final path = '/users/$userId/lists';
    // LoggerHelper.logger.d('user lists path: $path');
    return firestore.collection(path);
  }

  Stream<List<UserList>> getUserLists() async* {
    // LoggerHelper.logger.d('getting user lists');
    if (userId == null) {
      LoggerHelper.logger.d('no user yet');
      yield* Stream.value([]);
      return;
    }
    final listsCollection = await getCollection();
    yield* listsCollection.snapshots().map((snapshot) {
      // LoggerHelper.logger.d('snapshot.docs: ${snapshot.docs.length}');
      return snapshot.docs.map((doc) {
        return convertToUserList(doc.id, doc.data());
      }).toList();
    });
  }

  UserList convertToUserList(String id, Map<String, dynamic> data) {
    // LoggerHelper.logger.d('$className: convertToUserList $id $data');
    final tmp = UserList.fromJson(data);
    return tmp.copyWith(id: id, isOwnList: tmp.ownerId == userId);
  }

  Future<UserList> getUserList(String listId) async {
    // LoggerHelper.logger.d('getting user list: $listId');
    final listsCollection = await getCollection();
    final snapshot = await listsCollection.doc(listId).get();
    final data = snapshot.data();
    // LoggerHelper.logger.i('$className => user list data: $data');
    return convertToUserList(snapshot.id, data!);
  }

  Future<void> addList(UserList list) async {
    // LoggerHelper.logger.d('adding user list: $list');
    final listsCollection = await getCollection();
    final docId = listsCollection.doc().id;
    // LoggerHelper.logger.d('adding user list, docId: $docId');
    return listsCollection.doc(docId).set(list.copyWith(id: docId).toJson());
  }

  Future<void> updateList(UserList list) async {
    LoggerHelper.logger.d('$className: updaing user list: $list');
    final listsCollection = await getCollection();
    final doc = listsCollection.doc(list.id);
    LoggerHelper.logger.d('$className: doc: $doc');

    await doc.update(list.toJson());
    return;
  }

  Future<void> deleteList(String listId) async {
    // LoggerHelper.logger.d('deleting user list: $listId');

    final listsCollection = await getCollection();
    final querySnapshot =
        await listsCollection.where('actualListId', isEqualTo: listId).get();
    final documents = querySnapshot.docs;
    final document = documents.first;
    final docId = convertToUserList(document.id, document.data()).id;
    return listsCollection.doc(docId).delete();
  }
}
