import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firebase_firestore_extensions.dart';
import 'package:listanything/app/firebase/firestore_provider.dart';
import 'package:listanything/app/navigation/current_user_provider.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/lists/selected_list_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/base_repository.dart';
import 'package:listanything/app/widgets/standardWidgets/error_monitor.dart';

final listItemsRepositoryProvider = FutureProvider<BaseRepository<ListItem>>((ref) async {
  final firestore = await ref.watch(firestoreProvider.future);

  final currentUser = await ref.watch(currentUserProvider.future);
  final selectedListId = ref.watch(selectedListIdProvider);
  final errorMonitor = ErrorMonitor.device();
  return BaseRepositoryImpl<ListItem>(
    firestore,
    errorMonitor,
    firestore.listItems,
    firestore.listItem,
    {'userId': currentUser?.uid, 'listId': selectedListId},
    (data, id) => ListItem.fromJson(data).copyWith(id: id),
    (listItem) => listItem.toJson(),
  );
});
