import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/app/custom/pages/list_items/filter_page.dart';

@immutable
class FilterPageRoute extends GoRouteData {
  const FilterPageRoute({required this.publicListId});
  final String publicListId;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FilterPage(publicListId: publicListId);
  }
}
