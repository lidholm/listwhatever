import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listwhatever/auth/models/authentication_user.dart';
import 'package:listwhatever/firebase/firestore/firestore.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';

class UserListRepository {
  UserListRepository({required this.userId});
  final String? userId;

  Future<CollectionReference<Map<String, dynamic>>> getCollection() async {
    final path = '/users/$userId/lists';
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

  // Future<String> addPet(Pet pet) async {
  //   final listsCollection = await getCollection();
  //   final ref = await listsCollection.add(pet.toJson());
  //   return ref.id;
  // }

  UserList convertToUserList(String id, Map<String, dynamic> data) {
    final list = UserList.fromJson(data);
    return list.copyWith();
  }
}
