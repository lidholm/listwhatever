import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/list_items/addEditListItem/add_edit_list_item.dart';

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
    return AddEditListItem(publicListId: publicListId, listItemId: listItemId);
  }
}
