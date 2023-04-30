import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_item_provider.dart';
import 'package:listanything/app/pages/list_items/upsertListItem/upsert_list_item_form.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/lists_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/double_async_value_widget.dart';
import 'package:tuple/tuple.dart';

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
