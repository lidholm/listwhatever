import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'add_list_page.dart';

@immutable
class EditListPageRoute extends GoRouteData {
  const EditListPageRoute(this.actualListId);
  final String actualListId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AddListPage(listId: actualListId);
  }
}
