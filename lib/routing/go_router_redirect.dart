import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/auth/bloc/auth_bloc.dart';
import 'package:listwhatever/pages/auth/routes/login_page_route.dart';
import 'package:listwhatever/routing/routes.dart';

FutureOr<String?> routerRedirect(BuildContext context, GoRouterState state) {
  print('routerRedirect state.matchedLocation: ${state.matchedLocation}');

  final authBloc = BlocProvider.of<AuthBloc>(context);
  print('routerRedirect authBloc.state: ${authBloc.state}');

  if (state.matchedLocation == '/unknown') {
    print('routerRedirect return /');
    return '/';
  }

  if (isLoggedIn(authBloc)) {
    if (isLoggingInPage(state)) {
      print('routerRedirect return /');
      return '/list';
    }
  }

  if (isLoggedOut(authBloc)) {
    if (isProtectedPage(state)) {
      print('routerRedirect return /login');
      return '/login';
    }
  }

  print('routerRedirect return null');
  return null;
}

bool isLoggingInPage(GoRouterState state) {
  final urls = [
    const LoginPageRoute().location,
  ];
  // [RouteName.logIn.value, RouteName.signUp.value]
  return urls.contains(state.matchedLocation.replaceAll('/', ''));
}

bool isLoggedIn(AuthBloc authBloc) {
  print('go_router_redirect: authBloc.state: ${authBloc.state}');
  return authBloc.state is AuthLoggedIn ||
      authBloc.state is AuthOnboardingRequired;
}

bool isLoggedOut(AuthBloc authBloc) {
  return authBloc.state is AuthLoggedOut;
}

bool isProtectedPage(GoRouterState state) {
  final nonProtectedRoutes = [
    const LoginPageRoute().location,
  ];
  //[RouteName.logIn.value, RouteName.signUp.value]
  return !nonProtectedRoutes
      .contains(state.matchedLocation.replaceAll('/', ''));
}
