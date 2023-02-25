import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreExt on FirebaseFirestore {
  CollectionReference<Map<String, dynamic>> lists(String userId) {
    return collection('users/$userId/lists');
  }

  DocumentReference<Map<String, dynamic>> list(String userId, String listId) {
    return collection('users/$userId/lists').doc(listId);
  }

  CollectionReference<Map<String, dynamic>> listItems(String userId, String listId) {
    return collection('users/$userId/lists/$listId/items');
  }

  DocumentReference<Map<String, dynamic>> listItem(String userId, String listId, String listItemId) {
    return collection('users/$userId/lists/$listId/items').doc(listItemId);
  }
}
