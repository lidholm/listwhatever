import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreExt on FirebaseFirestore {
  CollectionReference<Map<String, dynamic>> lists(Map<String, String?> identifiers) {
    final path = 'users/${identifiers['userId']!}/lists';
    return collection(path);
  }

  DocumentReference<Map<String, dynamic>> list(Map<String, String?> identifiers) {
    final path = 'users/${identifiers['userId']!}/lists/${identifiers['itemId']!}';
    return doc(path);
  }

  CollectionReference<Map<String, dynamic>> listItems(Map<String, String?> identifiers) {
    final path = 'users/${identifiers['userId']!}/lists/${identifiers['listId']!}/items';
    return collection(path);
  }

  DocumentReference<Map<String, dynamic>> listItem(Map<String, String?> identifiers) {
    final path = 'users/${identifiers['userId']!}/lists/${identifiers['listId']!}/items/${identifiers['itemId']!}';
    return doc(path);
  }
}
