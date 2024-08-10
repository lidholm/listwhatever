import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/custom/pages/firebase_performance/firebase_performance_page.dart';

@immutable
class FirebasePerformancePageRoute extends GoRouteData {
  const FirebasePerformancePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FirebasePerformancePage();
  }
}
