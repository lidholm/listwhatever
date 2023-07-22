import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/app/standard/pages/analytics/analytics_page.dart';

@immutable
class AnalyticsPageRoute extends GoRouteData {
  const AnalyticsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final analytics = FirebaseAnalytics.instance;
    final observer = FirebaseAnalyticsObserver(analytics: analytics);

    return AnalyticsPage(
      title: 'Analytics',
      analytics: analytics,
      observer: observer,
    );
  }
}
