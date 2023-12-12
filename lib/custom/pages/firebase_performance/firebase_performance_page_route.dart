import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'firebase_performance.dart';

@immutable
class FirebasePerformancePageRoute extends GoRouteData {
  const FirebasePerformancePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FirebasePerformancePage();
  }
}
