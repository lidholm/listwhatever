import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/auth/bloc/auth_bloc.dart';
import 'package:listwhatever/routing/go_router_redirect.dart';
import 'package:listwhatever/routing/go_router_refresh_stream.dart';
import 'package:listwhatever/routing/routes.dart';

/// The route configuration.
GoRouter getGoRouterConfiguration(BuildContext context) {
  return GoRouter(
    refreshListenable: GoRouterRefreshStream([
      BlocProvider.of<AuthBloc>(context).stream,
    ]),
    debugLogDiagnostics: true,
    initialLocation: '/lists',
    redirect: routerRedirect,
    routes: $appRoutes,
  );
}
