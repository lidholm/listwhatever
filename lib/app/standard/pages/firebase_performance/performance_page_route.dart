import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/app/standard/pages/firebase_performance/performance_page.dart';

@immutable
class PerformancePageRoute extends GoRouteData {
  const PerformancePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PerformancePage();
  }
}
