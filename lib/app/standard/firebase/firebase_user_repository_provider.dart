import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/custom/pages/settings/settings.dart';
import '/app/standard/firebase/current_user.dart';
import '/app/standard/firebase/firebase_firestore_extensions.dart';
import '/app/standard/firebase/firestore_provider.dart';
import '/app/standard/widgets/base_repository.dart';
import '/app/standard/widgets/error_monitor.dart';

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
    (data, id) {
      print('Current user: $data');
      if (data == null) {
        return CurrentUser(
          uid: 'no',
          email: 'no',
          name: 'no',
          isAdmin: false,
          settings: defaultSettings,
        );
      }
      return CurrentUser.fromJson(data);
    },
    (user) => user.toJson(),
  );
});
