import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreExt on FirebaseFirestore {
  CollectionReference<Map<String, dynamic>> lists(String userId) {
    return collection('users/$userId/lists');
  }

  DocumentReference<Map<String, dynamic>> list(String userId, String listId) {
    return collection('users/$userId/lists').doc(listId);
  }
}
