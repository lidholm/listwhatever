import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/custom/pages/import/csv/import_csv_page.dart';

@immutable
class ImportCsvPageRoute extends GoRouteData {
  const ImportCsvPageRoute(this.actualListId);
  final String actualListId;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ImportCsvPage(actualListId: actualListId);
  }
}
