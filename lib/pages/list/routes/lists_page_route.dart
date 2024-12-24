import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/pages/list/pages/list_page.dart';

@immutable
class ListPageRoute extends GoRouteData {
  const ListPageRoute({required this.actualListId});
  final String actualListId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ListPage(listId: actualListId);
  }
}
