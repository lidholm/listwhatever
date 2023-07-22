import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/app/custom/pages/list_items/upsertListItem/add_list_item_form.dart';

@immutable
class AddListItemRoute extends GoRouteData {
  const AddListItemRoute({required this.publicListId});
  final String publicListId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AddListItemForm(publicListId: publicListId);
  }
}
