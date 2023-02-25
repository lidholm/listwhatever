import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_repository_provider.dart';

final selectedListItemIdProvider = StateProvider<String?>((ref) => null);

final selectedListItemProvider = StreamProvider<ListItem?>((ref) async* {
  final repo = await ref.watch(listItemsRepositoryProvider.future);
  final listItemId = ref.watch(selectedListItemIdProvider);
  if (listItemId == null) {
    yield* Stream.value(null);
  }
  yield* repo.retrieveListItemStream(listItemId: listItemId!);
});
