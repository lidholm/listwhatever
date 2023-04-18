// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/list_repository_provider.dart';
import 'package:listanything/app/pages/lists/participated_list_repository_provider.dart';
import 'package:listanything/app/pages/lists/public_list_id_repository_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

final _listsProvider = StreamProvider<List<ListOfThings>>((ref) async* {
  final listRepo = await ref.watch(listRepositoryProvider.future);
  yield* listRepo.retrieveItemsStream();
});

final _participatedListsProvider = StreamProvider<List<ListOfThings>>((ref) async* {
  final participatedListRepo = await ref.watch(participatedListRepositoryProvider.future);
  yield* participatedListRepo.retrieveItemsStream();
});

final combinedListsProvider = Provider<AsyncValue<List<ListOfThings>>>((ref) {
  final listsValue = ref.watch(_listsProvider);
  return listsValue.when(
    error: (e, st) {
      print('filteredListIemsProvider error: $e');
      print('filteredListIemsProvider error: $st');
      return AsyncValue.error(Tuple2(e, 'in _listsProvider'), st);
    },
    loading: () {
      print('filteredListIemsProvider loading');
      return const AsyncValue.loading();
    },
    data: (lists) {
      return ref.watch(_participatedListsProvider).when(
        error: (e, st) {
          print('filteredListIemsProvider error: $e');
          print('filteredListIemsProvider error: $st');
          return AsyncValue.error(Tuple2(e, 'in _participatedListsProvider'), st);
        },
        loading: () {
          print('filteredListIemsProvider loading');
          return const AsyncValue.loading();
        },
        data: (participatedLists) {
          print('lists: $lists');
          print('participatedLists: $participatedLists');
          return AsyncValue.data(lists + participatedLists);
        },
      );
    },
  );
});

final listProvider = StreamProvider.family<ListOfThings, String>((ref, publicListId) async* {
  final publicListIdRepo = await ref.watch(publicListIdRepositoryProvider.future);
  final repo = await ref.watch(listRepositoryProvider.future);
  yield* publicListIdRepo.retrieveItemStream(itemId: publicListId).switchMap(
        (item) => repo.retrieveItemStreamAtPath(item.path),
      );
});
