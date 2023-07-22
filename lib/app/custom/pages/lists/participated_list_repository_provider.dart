import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/custom/pages/lists/list_of_things.dart';
import '/app/standard/firebase/firebase_firestore_extensions.dart';
import '/app/standard/firebase/firestore_provider.dart';
import '/app/standard/helpers/combine_two_async_values.dart';
import '/app/standard/navigation/current_user_provider.dart';
import '/app/standard/widgets/base_repository.dart';
import '/app/standard/widgets/error_monitor.dart';

final participatedListRepositoryProvider =
    Provider<AsyncValue<BaseRepository<ListOfThings>>>((ref) {
  final firestoreValue = ref.watch(firestoreProvider);
  final currentUserValue = ref.watch(currentUserProvider);

  final errorMonitor = ErrorMonitor.device();

  return combineTwoAsyncValues(firestoreValue, currentUserValue).when(
    error: AsyncValue.error,
    loading: AsyncValue.loading,
    data: (data) {
      final firestore = data.item1;
      final currentUser = data.item2;

      return AsyncValue.data(
        BaseRepositoryImpl<ListOfThings>(
          firestore,
          errorMonitor,
          firestore.participatedLists,
          firestore.participatedList,
          {'userId': currentUser?.uid},
          (data, id) {
            final viewers = data!['viewers'] as Map<String, dynamic>;
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
            throw Exception("Don't think this should happen");
          },
        ),
      );
    },
  );
});
