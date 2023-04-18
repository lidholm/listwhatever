import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/list_items/addEditListItem/add_edit_list_item.dart';

@immutable
class AddListItemRoute extends GoRouteData {
  const AddListItemRoute({required this.publicListId});
  final String publicListId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AddEditListItem(publicListId: publicListId, listItemId: null);
  }
}
