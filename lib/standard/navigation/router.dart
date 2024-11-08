import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '/standard/app/bloc/app_bloc.dart';
import '/standard/app/widgets/authenticated_user_listener.dart';

import '/standard/navigation/app_redirect.dart';
import 'models/router_provider_information.dart';

GoRouter getRouter({
  required BuildContext context,
  required List<RouteBase> routes,
  required RouterProviderInformation routerProviderInformation,
  String? initialLocation,
  List<NavigatorObserver>? observers,
}) {
  final shellNavigatorKey = GlobalKey<NavigatorState>();
  final router = GoRouter(
    refreshListenable: GoRouterRefreshStream([
      BlocProvider.of<AppBloc>(context).stream,
    ]),
    debugLogDiagnostics: true,
    initialLocation:
        initialLocation ?? routerProviderInformation.initialRouteLocation,
    navigatorKey: GlobalKey(),
    observers: observers ??
        [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)],
    redirect: (context, state) async =>
        AppRedirect().appRedirect(context, state, routerProviderInformation),
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        observers: observers ??
            [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)],
        builder: (context, state, child) {
          return AuthenticatedUserListener(
            child: child,
          );
        },
        routes: routes,
      ),
    ],
  );
  return router;
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(List<Stream<dynamic>> streams) {
    for (final stream in streams) {
      notifyListeners();
      _subscriptions.add(
        stream.asBroadcastStream().listen(
          (dynamic value) {
            notifyListeners();
          },
        ),
      );
    }
  }
  static String className = 'GoRouterRefreshStream';

  @override
  String toString() {
    return 'GoRouterRefreshStream';
  }

  final List<StreamSubscription<dynamic>> _subscriptions = [];

  @override
  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }
}
