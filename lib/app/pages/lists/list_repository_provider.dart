import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firebase_firestore_extensions.dart';
import 'package:listanything/app/firebase/firestore_provider.dart';
import 'package:listanything/app/firebase/firestore_user.dart';
import 'package:listanything/app/helpers/combine_two_async_values.dart';
import 'package:listanything/app/navigation/current_user_provider.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/widgets/standardWidgets/base_repository.dart';
import 'package:listanything/app/widgets/standardWidgets/error_monitor.dart';

final listRepositoryProvider =
    Provider<AsyncValue<BaseRepository<ListOfThings>>>((ref) {
  final firestoreValue = ref.watch(firestoreProvider);
  final currentUserValue = ref.watch(currentUserProvider);
  final errorMonitor = ErrorMonitor.device();

  return combineTwoAsyncValues<FirebaseFirestore, FirestoreUser?>(
    firestoreValue,
    currentUserValue,
  ).when(
    error: AsyncValue.error,
    loading: AsyncValue.loading,
    data: (data) {
      final firestore = data.item1;
      final currentUser = data.item2;

      return AsyncValue.data(
        BaseRepositoryImpl<ListOfThings>(
          firestore,
          errorMonitor,
          firestore.lists,
          firestore.list,
          {'userId': currentUser?.uid},
          (data, id) {
            final viewers = data['viewers'] as Map<String, dynamic>;
            final editors = data['editors'] as Map<String, dynamic>;
            final hasEditor = (editors[currentUser?.uid] as bool?) ?? false;
            final hasViewer = (viewers[currentUser?.uid] as bool?) ?? false;
            return ListOfThings.fromJson(data).copyWith(
              id: id,
              shared: editors.keys.length > 1 || viewers.keys.isNotEmpty,
              isViewer: hasEditor || hasViewer,
              isEditor: hasEditor,
            );
          },
          (list) {
            return list.toJson()
              ..remove('isEditor')
              ..remove('isViewer');
          },
        ),
      );
    },
  );
});
