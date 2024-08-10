import 'package:cloud_firestore/cloud_firestore.dart';

import '/custom/pages/shareList/shared_list.dart';
import '/standard/firebaseService/firebase_service.dart';

class SharedListsService extends FirestoreService {
  SharedListsService({super.userId});

  Future<CollectionReference<Map<String, dynamic>>> getCollection() async {
    const path = '/sharedLists';
    // logger.d('path: $path');
    return firestore.collection(path);
  }

  Future<SharedList> getSharedList(String id) async {
    final sharedListsCollection = await getCollection();
    final snapshot = await sharedListsCollection.doc(id).get();
    final data = snapshot.data()!;
    return SharedList.fromJson(data).copyWith(id: snapshot.id);
  }

  Future<void> addUser(String id, String userId) async {
    final sharedListsCollection = await getCollection();
    return sharedListsCollection.doc(id).collection('users').doc(userId).set({'userId': userId});
  }

  // TODO:
  // Future<void> deleteSharedList(String sharedListId) async {
  //   final sharedListsCollection = await getCollection();
  //   return sharedListsCollection.doc(sharedListId).delete();
  // }
}
