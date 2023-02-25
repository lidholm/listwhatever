// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/list_repository_provider.dart';

final listsProvider = StreamProvider<List<ListOfThings>>((ref) async* {
  final repo = await ref.watch(listRepositoryProvider.future);
  yield* repo.retrieveListsStream();
});
