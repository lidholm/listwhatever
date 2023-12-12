import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'add_list_item_page.dart';

@immutable
class AddListItemPageRoute extends GoRouteData {
  const AddListItemPageRoute(this.listId);
  final String listId;


  @override
  Widget build(BuildContext context, GoRouterState state) {
    return  AddListItemPage(listId: listId);
  }
}
