import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/current_user.dart';
import 'package:listanything/app/firebase/firebase_firestore_extensions.dart';
import 'package:listanything/app/firebase/firestore_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/base_repository.dart';
import 'package:listanything/app/widgets/standardWidgets/error_monitor.dart';

final currentUserRepositoryProvider =
    FutureProvider<BaseRepository<CurrentUser>>((ref) async {
  final firestore = await ref.watch(firestoreProvider.future);
  final errorMonitor = ErrorMonitor.device();

  return BaseRepositoryImpl<CurrentUser>(
    firestore,
    errorMonitor,
    firestore.users,
    firestore.user,
    {},
    (data, id) => CurrentUser.fromJson(data),
    (user) => user.toJson(),
  );
});
