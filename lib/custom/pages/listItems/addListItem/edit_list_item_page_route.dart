import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'add_list_item_page.dart';

@immutable
class EditListItemPageRoute extends GoRouteData {
  const EditListItemPageRoute(this.listId, this.itemId);
  final String listId;
  final String itemId;


  @override
  Widget build(BuildContext context, GoRouterState state) {
    return  AddListItemPage(listId: listId, listItemId: itemId);
  }
}
