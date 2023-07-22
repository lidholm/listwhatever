import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/app/custom/pages/lists/lists_page.dart';

@immutable
class ListsPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ListsPage();
  }
}
