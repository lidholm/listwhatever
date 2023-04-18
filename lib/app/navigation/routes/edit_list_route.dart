import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/lists/addEditList/add_edit_list.dart';

@immutable
class EditListRoute extends GoRouteData {
  const EditListRoute({this.publicListId});
  final String? publicListId;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AddEditList(
      publicListId: publicListId,
    );
  }
}
