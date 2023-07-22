import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/app/custom/pages/lists/addEditList/add_edit_list.dart';

@immutable
class AddListRoute extends GoRouteData {
  const AddListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddEditList(publicListId: null);
  }
}
