import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/list_items/upsertListItem/upsert_list_item_form.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/lists_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/async_value_widget.dart';

class AddListItemForm extends ConsumerWidget {
  const AddListItemForm({
    required this.publicListId,
    super.key,
  });
  final String publicListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget<ListOfThings?>(
      value: ref.watch(listProvider(publicListId)),
      data: (list) {
        if (list == null) {
          return const CircularProgressIndicator();
        }
        return UpsertListItemForm(
          listItem: null,
          list: list,
        );
      },
    );
  }
}
