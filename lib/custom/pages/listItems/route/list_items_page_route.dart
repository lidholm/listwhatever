import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/custom/pages/listItems/listItemsPage/list_items_page.dart';

@immutable
class ListItemsPageRoute extends GoRouteData {
  const ListItemsPageRoute({required this.actualListId});
  final String actualListId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ListItemsPage(actualListId: actualListId);
  }
}
