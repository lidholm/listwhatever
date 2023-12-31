import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/custom/pages/subscribeList/subscribe_list_page.dart';

@immutable
class SubscribeListPageRoute extends GoRouteData {
  const SubscribeListPageRoute(this.code);
  final String code;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SubscribeListPage(shareCode: code);
  }
}
