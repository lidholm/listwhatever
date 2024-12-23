import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/pages/lists/pages/add_list_page.dart';

@immutable
class AddListPageRoute extends GoRouteData {
  const AddListPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddListPage();
  }
}
