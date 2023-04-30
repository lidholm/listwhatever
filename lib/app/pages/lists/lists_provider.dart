// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/list_repository_provider.dart';
import 'package:listanything/app/pages/lists/participated_list_repository_provider.dart';
import 'package:listanything/app/pages/lists/public_list_id_repository_provider.dart';
import 'package:rxdart/rxdart.dart';

final _listsProvider = StreamProvider<List<ListOfThings>>((ref) async* {
  final listRepo = await ref.watch(listRepositoryProvider.future);
  yield* listRepo.retrieveItemsStream();
});

final _participatedListsProvider =
    StreamProvider<List<ListOfThings>>((ref) async* {
  final participatedListRepo =
      await ref.watch(participatedListRepositoryProvider.future);
  yield* participatedListRepo.retrieveItemsStream();
});

final combinedListsProvider = Provider<AsyncValue<List<ListOfThings>>>((ref) {
  final listsValue = ref.watch(_listsProvider);
  final participatedListVlaue = ref.watch(_participatedListsProvider);
  return combineTwoAsyncValues(listsValue, participatedListVlaue).when(
    data: (data) => AsyncValue.data(data.item1 + data.item2),
    error: AsyncValue.error,
    loading: AsyncValue.loading,
  );
});

final listProvider =
    StreamProvider.family<ListOfThings, String>((ref, publicListId) async* {
  final publicListIdRepo =
      await ref.watch(publicListIdRepositoryProvider.future);
  final repo = await ref.watch(listRepositoryProvider.future);
  yield* publicListIdRepo.retrieveItemStream(itemId: publicListId).switchMap(
        (item) => repo.retrieveItemStreamAtPath(item.path),
      );
});
