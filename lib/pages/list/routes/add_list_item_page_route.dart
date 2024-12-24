import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class AddListItemPageRoute extends GoRouteData {
  const AddListItemPageRoute({required this.actualListId});
  final String actualListId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Text('AddListItem');
    // AddListItemPage(listId: actualListId);
  }
}
