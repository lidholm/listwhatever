import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listwhatever/auth/models/authentication_user.dart';
import 'package:listwhatever/firestore/firestore.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';

class UserListRepository {
  UserListRepository({required this.userId});
  String? userId;

  // ignore: use_setters_to_change_properties
  void changeUser(String? userId) {
    this.userId = userId;
  }

  Future<CollectionReference<Map<String, dynamic>>> getCollection() async {
    final path = '/users/$userId/lists';
    print('UserListRepository path: $path');
    return (await getFirestore()).collection(path);
  }

  Stream<List<UserList>> loadUserLists() async* {
    if (userId == null || userId == anonymousId) {
      yield [];
      return;
    }

    final listsCollection = await getCollection();

    yield* listsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return convertToUserList(doc.id, doc.data());
      }).toList();
    });
  }

  UserList convertToUserList(String id, Map<String, dynamic> data) {
    final list = UserList.fromJson(data);
    return list.copyWith();
  }

  Future<String> addUserList(UserList userList) async {
    if (userId == null || userId == anonymousId) {
      return 'this should not happen';
    }

    final listsCollection = await getCollection();
    final ref = await listsCollection.add(userList.toJson());
    return ref.id;
  }
}
