import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_repository_provider.dart';

final listItemsProvider = StreamProvider<List<ListItem>?>((ref) async* {
  final repo = await ref.watch(listItemsRepositoryProvider.future);
  yield* repo.retrieveItemsStream();
});
