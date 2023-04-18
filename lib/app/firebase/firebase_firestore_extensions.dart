import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreExt on FirebaseFirestore {
  CollectionReference<Map<String, dynamic>> lists(Map<String, String?> identifiers) {
    final path = getPathForLists(identifiers['userId']!);
    print('lists path: $path');
    return collection(path);
  }

  DocumentReference<Map<String, dynamic>> list(Map<String, String?> identifiers) {
    final path = getPathForList(identifiers['userId']!, identifiers['itemId']!);
    print('list path: $path');
    return doc(path);
  }

  CollectionReference<Map<String, dynamic>> listItems(Map<String, String?> identifiers) {
    final path = getPathForListItems(identifiers['userId']!, identifiers['listId']!);
    print('listItems path: $path');
    return collection(path);
  }

  DocumentReference<Map<String, dynamic>> listItem(Map<String, String?> identifiers) {
    final path = getPathForListItem(identifiers['userId']!, identifiers['listId']!, identifiers['itemId']!);
    print('listItem path: $path');
    return doc(path);
  }

  CollectionReference<Map<String, dynamic>> publicListIds(Map<String, String?> identifiers) {
    final path = getPathForPublicListIds();
    print('publicListIds path: $path');
    return collection(path);
  }

  DocumentReference<Map<String, dynamic>> publicListId(Map<String, String?> identifiers) {
    final path = getPathForPublicListId(identifiers['itemId']!);
    print('publicListId path: $path');
    return doc(path);
  }

  CollectionReference<Map<String, dynamic>> participatedLists(Map<String, String?> identifiers) {
    final path = getPathForParticipatedLists(identifiers['userId']!);
    print('lists path: $path');
    return collection(path);
  }

  DocumentReference<Map<String, dynamic>> participatedList(Map<String, String?> identifiers) {
    final path = getPathForParticipatedList(identifiers['userId']!, identifiers['itemId']!);
    print('participatedList path: $path');
    return doc(path);
  }
}

String getPathForLists(String userId) {
  return 'users/$userId/lists';
}

String getPathForList(String userId, String listId) {
  return 'users/$userId/lists/$listId';
}

String getPathForListItems(String userId, String listId) {
  return 'users/$userId/lists/$listId/items';
}

String getPathForListItem(String userId, String listId, String listItemId) {
  return 'users/$userId/lists/$listId/items/$listItemId';
}

String getPathForPublicListIds() {
  return 'publicListIds/';
}

String getPathForPublicListId(String publicListId) {
  return 'publicListIds/$publicListId';
}

String getPathForParticipatedLists(String userId) {
  return 'users/$userId/participatedLists';
}

String getPathForParticipatedList(String userId, String listId) {
  return 'users/$userId/participatedLists/$listId';
}
