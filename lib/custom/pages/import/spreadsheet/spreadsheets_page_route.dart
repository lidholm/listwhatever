import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/pages/import/spreadsheet/spreadsheets_page.dart';

@immutable
class SpreadsheetsPageRoute extends GoRouteData {
  const SpreadsheetsPageRoute(this.listId);
  final String listId;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PlutoGridExamplePage(/*listId: listId*/);
  }
}
