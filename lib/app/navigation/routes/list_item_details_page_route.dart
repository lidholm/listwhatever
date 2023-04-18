import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/list_items/list_item_details/list_item_details_page.dart';

@immutable
class ListItemDetailsPageRoute extends GoRouteData {
  const ListItemDetailsPageRoute({required this.publicListId, this.listItemId});
  final String publicListId;
  final String? listItemId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ListItemDetailsPage(publicListId: publicListId, listItemId: listItemId);
  }
}
