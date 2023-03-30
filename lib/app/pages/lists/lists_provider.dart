// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/list_repository_provider.dart';
import 'package:listanything/app/pages/lists/share_code_repository_provider.dart';
import 'package:rxdart/rxdart.dart';

final listsProvider = StreamProvider<List<ListOfThings>>((ref) async* {
  final repo = await ref.watch(listRepositoryProvider.future);
  yield* repo.retrieveItemsStream();
});

final listProvider = StreamProvider.family<ListOfThings, String>((ref, shareCode) async* {
  final shareCodeRepo = await ref.watch(shareCodeRepositoryProvider.future);
  final repo = await ref.watch(listRepositoryProvider.future);
  yield* shareCodeRepo.retrieveItemStream(itemId: shareCode).switchMap(
        (item) => repo.retrieveItemStreamAtPath(item.path),
      );
});
