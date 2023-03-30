import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreExt on FirebaseFirestore {
  CollectionReference<Map<String, dynamic>> lists(Map<String, String?> identifiers) {
    final path = 'users/${identifiers['userId']!}/lists';
    print('lists path: $path');
    return collection(path);
  }

  DocumentReference<Map<String, dynamic>> list(Map<String, String?> identifiers) {
    final path = 'users/${identifiers['userId']!}/lists/${identifiers['itemId']!}';
    print('list path: $path');
    return doc(path);
  }

  CollectionReference<Map<String, dynamic>> listItems(Map<String, String?> identifiers) {
    final path = 'users/${identifiers['userId']!}/lists/${identifiers['listId']!}/items';
    print('listItems path: $path');
    return collection(path);
  }

  DocumentReference<Map<String, dynamic>> listItem(Map<String, String?> identifiers) {
    final path = 'users/${identifiers['userId']!}/lists/${identifiers['listId']!}/items/${identifiers['itemId']!}';
    print('listItem path: $path');
    return doc(path);
  }

  CollectionReference<Map<String, dynamic>> shareCodes(Map<String, String?> identifiers) {
    const path = 'listIds/';
    print('shareCodes path: $path');
    return collection(path);
  }

  DocumentReference<Map<String, dynamic>> shareCode(Map<String, String?> identifiers) {
    final path = 'listIds/${identifiers['itemId']!}';
    print('shareCode path: $path');
    return doc(path);
  }
}
