import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'add_list_item_page.dart';

@immutable
class EditListItemPageRoute extends GoRouteData {
  const EditListItemPageRoute(this.actualListId, this.itemId);
  final String actualListId;
  final String itemId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AddListItemPage(actualListId: actualListId, listItemId: itemId);
  }
}
