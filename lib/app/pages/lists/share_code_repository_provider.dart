import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firebase_firestore_extensions.dart';
import 'package:listanything/app/firebase/firestore_provider.dart';
import 'package:listanything/app/pages/lists/share_code.dart';
import 'package:listanything/app/widgets/standardWidgets/base_repository.dart';
import 'package:listanything/app/widgets/standardWidgets/error_monitor.dart';

final shareCodeRepositoryProvider = FutureProvider<BaseRepository<ShareCode>>((ref) async {
  final firestore = await ref.watch(firestoreProvider.future);
  final errorMonitor = ErrorMonitor.device();

  return BaseRepositoryImpl<ShareCode>(
    firestore,
    errorMonitor,
    firestore.shareCodes,
    firestore.shareCode,
    {},
    (data, id) => ShareCode.fromJson(data),
    (list) => list.toJson(),
  );
});
