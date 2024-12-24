import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/pages/list/pages/add_list_item_page.dart';

@immutable
class AddListItemPageRoute extends GoRouteData {
  const AddListItemPageRoute({required this.actualListId});
  final String actualListId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AddListItemPage(listId: actualListId);
  }
}
