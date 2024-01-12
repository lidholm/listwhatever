import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'lists_page.dart';

@immutable
class ListsPageRoute extends GoRouteData {
  const ListsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ListsPage();
  }
}
