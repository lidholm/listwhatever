import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/list_repository_provider.dart';

final selectedListIdProvider = StateProvider<String?>((ref) => null);

final selectedListProvider = StreamProvider<ListOfThings?>((ref) async* {
  final repo = await ref.watch(listRepositoryProvider.future);
  final listId = ref.watch(selectedListIdProvider);
  if (listId == null) {
    yield* Stream.value(null);
    return;
  }
  yield* repo.retrieveItemStream(itemId: listId);
});
