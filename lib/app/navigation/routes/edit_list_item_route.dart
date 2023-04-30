import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/list_items/upsertListItem/edit_list_item_form.dart';

@immutable
class EditListItemRoute extends GoRouteData {
  const EditListItemRoute({
    required this.publicListId,
    required this.listItemId,
  });
  final String publicListId;
  final String listItemId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return EditListItemForm(publicListId: publicListId, listItemId: listItemId);
  }
}
