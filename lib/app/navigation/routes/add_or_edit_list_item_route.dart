import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/list_items/addEditListItem/add_edit_list_item.dart';

@immutable
class AddOrEditListItemRoute extends GoRouteData {
  const AddOrEditListItemRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddEditListItem();
  }
}
