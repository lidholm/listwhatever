import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listwhatever/custom/pages/lists/models/user_list.dart';

import '/standard/constants.dart';
import '/standard/firebase/firestore/firestore.dart';

class UserListsService {
  UserListsService({required this.userId}) {
    _initFirestore();
  }

  String? userId;
  late final FirebaseFirestore firestore;

  Future<void> _initFirestore() async {
    firestore = await getFirestore();
  }

  // ignore: use_setters_to_change_properties
  void changeUser(String? userId) {
    this.userId = userId;
  }

  Future<CollectionReference<Map<String, dynamic>>> getCollection() async {
    final path = '/users/$userId/lists';
    logger.d('user lists path: $path');
    return firestore.collection(path);
  }

  Stream<List<UserList>> getLists() async* {
    logger.d('getting user lists');
    if (userId == null) {
      logger.d('no user yet');
      yield* Stream.value([]);
      return;
    }
    final listsCollection = await getCollection();
    yield* listsCollection.snapshots().map((snapshot) {
      // logger.d('snapshot.docs: ${snapshot.docs.length}');
      return snapshot.docs.map((doc) {
        return convertToUserList(doc.id, doc.data());
      }).toList();
    });
  }

  UserList convertToUserList(String id, Map<String, dynamic> data) {
    final tmp = UserList.fromJson(data);
    return tmp.copyWith(id: id, isOwnList: tmp.ownerId == userId);
  }

  Future<UserList> getList(String id) async {
    logger.d('getting user list: $id');
    final listsCollection = await getCollection();
    final snapshot = await listsCollection.doc(id).get();
    return convertToUserList(snapshot.id, snapshot.data()!);
  }

  Future<void> addList(UserList list) async {
    logger.d('adding user list: $list');
    final listsCollection = await getCollection();
    final docId = listsCollection.doc().id;
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
    return listsCollection.doc(listId).delete();
  }
}
