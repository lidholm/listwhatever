import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'list_items_page.dart';

@immutable
class ListItemsPageRoute extends GoRouteData {
  const ListItemsPageRoute({required this.listId});
  final String listId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ListItemsPage(listId: listId);
  }
}
