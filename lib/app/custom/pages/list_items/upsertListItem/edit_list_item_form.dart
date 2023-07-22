import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import '/app/custom/pages/list_items/list_item.dart';
import '/app/custom/pages/list_items/list_item_provider.dart';
import '/app/custom/pages/list_items/upsertListItem/upsert_list_item_form.dart';
import '/app/custom/pages/lists/list_of_things.dart';
import '/app/custom/pages/lists/lists_provider.dart';
import '/app/standard/widgets/double_async_value_widget.dart';

class EditListItemForm extends ConsumerWidget {
  const EditListItemForm({
    required this.publicListId,
    required this.listItemId,
    super.key,
  });
  final String publicListId;
  final String listItemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DoubleAsyncValueWidget<ListItem?, ListOfThings?>(
      firstValue: ref.watch(listItemProvider(Tuple2(publicListId, listItemId))),
      secondValue: ref.watch(listProvider(publicListId)),
      data: (listItem, list) => UpsertListItemForm(
        listItem: listItem,
        list: list!,
      ),
    );
  }
}
