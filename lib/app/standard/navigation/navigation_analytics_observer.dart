import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import '/app/standard/helpers/constants.dart';

extension on Route<dynamic> {
  String get str => 'route(${settings.name}: ${settings.arguments})';
}

class NavigationAnalyticsObserver extends NavigatorObserver {
  NavigationAnalyticsObserver({required this.analytics}) {
    // log.onRecord.listen((e) => debugPrint('$e'));
  }
  final FirebaseAnalytics analytics;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logger.i('didPush: ${route.str}, previousRoute= ${previousRoute?.str}');
    analytics.setCurrentScreen(screenName: route.str);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logger.i('didPop: ${route.str}, previousRoute= ${previousRoute?.str}');
    analytics.setCurrentScreen(screenName: previousRoute?.str);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logger.i('didRemove: ${route.str}, previousRoute= ${previousRoute?.str}');
    analytics.setCurrentScreen(screenName: previousRoute?.str);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    logger.i('didReplace: new= ${newRoute?.str}, old= ${oldRoute?.str}');
    analytics.setCurrentScreen(screenName: newRoute?.str);
  }

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) =>
      logger.i(
        'didStartUserGesture: ${route.str}, '
        'previousRoute= ${previousRoute?.str}',
      );

  @override
  void didStopUserGesture() => logger.i('didStopUserGesture');
}
