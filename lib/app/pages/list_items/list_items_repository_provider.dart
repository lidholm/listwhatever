import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firestore_provider.dart';
import 'package:listanything/app/navigation/current_user_provider.dart';
import 'package:listanything/app/pages/list_items/list_items_repository.dart';
import 'package:listanything/app/pages/lists/selected_list_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/error_monitor.dart';

final listItemsRepositoryProvider = FutureProvider<BaseListItemsRepository>((ref) async {
  final firestore = await ref.watch(firestoreProvider.future);

  final currentUser = await ref.watch(currentUserProvider.future);
  final selectedListId = ref.watch(selectedListIdProvider);
  final errorMonitor = ErrorMonitor.device();
  return ListItemsRepository(firestore, errorMonitor, currentUser?.uid, selectedListId);
});
