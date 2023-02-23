import 'package:flutter/material.dart';
import 'package:flutterbase/app/pages/counter/counter_page.dart';
import 'package:go_router/go_router.dart';

@immutable
class CounterPageRoute extends GoRouteData {
  const CounterPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CounterPage();
  }
}
