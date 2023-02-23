import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/counter/counter_page.dart';

@immutable
class CounterPageRoute extends GoRouteData {
  const CounterPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CounterPage();
  }
}
