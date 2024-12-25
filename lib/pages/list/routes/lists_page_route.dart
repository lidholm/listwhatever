import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/pages/list/pages/list_page.dart';
import 'package:listwhatever/pages/lists/pages/add_list_page.dart';

@immutable
class ListPageRoute extends GoRouteData {
  const ListPageRoute({required this.actualListId});
  final String actualListId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if (actualListId == 'add') {
      return const AddListPage();
    }
    return ListPage(listId: actualListId);
  }
}
