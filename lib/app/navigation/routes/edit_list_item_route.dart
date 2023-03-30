import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/list_items/addEditListItem/add_edit_list_item.dart';

@immutable
class EditListItemRoute extends GoRouteData {
  const EditListItemRoute({required this.shareCode, this.listItemId});
  final String shareCode;
  final String? listItemId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AddEditListItem(shareCode: shareCode, listItemId: listItemId);
  }
}
