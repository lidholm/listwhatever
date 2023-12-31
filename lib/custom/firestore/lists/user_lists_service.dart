import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listanything/custom/firestore/lists/user_list.dart';
import 'package:listanything/standard/firebase/firestore/firestore.dart';


class UserListsService {
  UserListsService({required this.userId});

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

  Stream<List<UserList>> getLists() async* {
    final listsCollection = await getCollection();
    yield* listsCollection.snapshots().map((snapshot) {
      // logger.d('snapshot.docs: ${snapshot.docs.length}');
      return snapshot.docs.map((doc) {
        return convertToUserList(doc.id, doc.data());
      }).toList();
    });
  }

  UserList convertToUserList(String id, Map<String, dynamic> data) {
    final list = UserList.fromJson(data);
    final tmp = UserList.fromJson(data);
    return tmp.copyWith(id: id, isOwnList: tmp.ownerId == userId);
  }

  Future<UserList> getList(String id) async {
    final listsCollection = await getCollection();
    final snapshot = await listsCollection.doc(id).get();
    return convertToUserList(snapshot.id, snapshot.data()!);
  }

  Future<void> addList(UserList list) async {
    final listsCollection = await getCollection();
    final docId=listsCollection.doc().id;
    return listsCollection.doc(docId).set(list.copyWith(id: docId).toJson());
  }

  Future<void> updateList(UserList list) async {
    final listsCollection = await getCollection();
    return listsCollection.doc(list.id).update(list.toJson());
  }

  Future<void> deleteList(String listId) async {
    final listsCollection = await getCollection();
    return listsCollection.doc(listId).delete();
  }
}
