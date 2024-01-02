import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/standard/onScreenLog/on_screen_logs_page.dart';

@immutable
class OnScreenLogsPageRoute extends GoRouteData {
  const OnScreenLogsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OnScreenLogsPage();
  }
}
