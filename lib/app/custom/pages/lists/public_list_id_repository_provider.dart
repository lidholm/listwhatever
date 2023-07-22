import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/custom/pages/lists/public_list_id.dart';
import '/app/standard/firebase/firebase_firestore_extensions.dart';
import '/app/standard/firebase/firestore_provider.dart';
import '/app/standard/widgets/base_repository.dart';
import '/app/standard/widgets/error_monitor.dart';

final publicListIdRepositoryProvider =
    FutureProvider<BaseRepository<PublicListId>>((ref) async {
  final firestore = await ref.watch(firestoreProvider.future);
  final errorMonitor = ErrorMonitor.device();

  return BaseRepositoryImpl<PublicListId>(
    firestore,
    errorMonitor,
    firestore.publicListIds,
    firestore.publicListId,
    {},
    (data, id) => PublicListId.fromJson(data!),
    (list) => list.toJson(),
  );
});
