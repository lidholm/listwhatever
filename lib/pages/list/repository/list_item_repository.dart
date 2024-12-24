import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listwhatever/firestore/firestore.dart';
import 'package:listwhatever/pages/list/models/list_item.dart';

class ListItemRepository {
  ListItemRepository();

  Future<CollectionReference<Map<String, dynamic>>> getCollection(
    String listId,
  ) async {
    final path = '/lists/$listId/items';
    print('ListRepository path: $path');
    return (await getFirestore()).collection(path);
  }

  Future<List<ListItem>> loadListItems(String listId) async {
    final listsCollection = await getCollection(listId);

    final snapshot = await listsCollection.get();
    final docs = snapshot.docs;
    final listItems = <ListItem>[];
    for (final doc in docs) {
      listItems.add(convertToListItem(doc.id, doc.data()));
    }
    return listItems;
  }

  ListItem convertToListItem(String id, Map<String, dynamic> data) {
    final list = ListItem.fromJson(data);
    return list.copyWith(
      id: id,
    );
  }

  // Future<String> addList(ListOfThings list) async {
  //   final listsCollection = await getCollection();
  //   final ref = await listsCollection.add(list.toJson());
  //   return ref.id;
  // }
}
