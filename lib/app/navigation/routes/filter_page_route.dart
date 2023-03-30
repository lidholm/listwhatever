import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/list_items/filter_page.dart';

@immutable
class FilterPageRoute extends GoRouteData {
  const FilterPageRoute({required this.shareCode});
  final String shareCode;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FilterPage(shareCode: shareCode);
  }
}
