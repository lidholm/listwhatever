import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/pages/import/spreadsheet/list_as_spreadsheets_page.dart';

@immutable
class ListAsSpreadsheetsPageRoute extends GoRouteData {
  const ListAsSpreadsheetsPageRoute(this.listId);
  final String listId;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ListAsSpreadsheetsPage(/*listId: listId*/);
  }
}
