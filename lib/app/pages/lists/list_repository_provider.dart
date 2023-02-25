import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firestore_provider.dart';
import 'package:listanything/app/navigation/current_user_provider.dart';
import 'package:listanything/app/pages/lists/list_repository.dart';
import 'package:listanything/app/widgets/standardWidgets/error_monitor.dart';

final listRepositoryProvider = FutureProvider<BaseListRepository>((ref) async {
  final firestore = await ref.watch(firestoreProvider.future);

  final currentUser = await ref.watch(currentUserProvider.future);
  final errorMonitor = ErrorMonitor.device();
  return ListRepository(firestore, errorMonitor, currentUser?.uid);
});
