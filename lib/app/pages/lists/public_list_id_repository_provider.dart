import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firebase_firestore_extensions.dart';
import 'package:listanything/app/firebase/firestore_provider.dart';
import 'package:listanything/app/pages/lists/public_list_id.dart';
import 'package:listanything/app/widgets/standardWidgets/base_repository.dart';
import 'package:listanything/app/widgets/standardWidgets/error_monitor.dart';

final publicListIdRepositoryProvider = FutureProvider<BaseRepository<PublicListId>>((ref) async {
  final firestore = await ref.watch(firestoreProvider.future);
  final errorMonitor = ErrorMonitor.device();

  return BaseRepositoryImpl<PublicListId>(
    firestore,
    errorMonitor,
    firestore.publicListIds,
    firestore.publicListId,
    {},
    (data, id) => PublicListId.fromJson(data),
    (list) => list.toJson(),
  );
});
