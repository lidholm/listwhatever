import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/list_items/addEditListItem/add_edit_list_item.dart';

@immutable
class AddListItemRoute extends GoRouteData {
  const AddListItemRoute({required this.shareCode});
  final String shareCode;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AddEditListItem(shareCode: shareCode, listItemId: null);
  }
}
