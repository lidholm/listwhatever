import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/auth/bloc/auth_bloc.dart';
import 'package:listwhatever/routing/go_router_configuration.dart';

FutureOr<String?> routerRedirect(BuildContext context, GoRouterState state) {
  print('routerRedirect state.matchedLocation: ${state.matchedLocation}');
  final authBloc = BlocProvider.of<AuthBloc>(context);
  print('routerRedirect authBloc.state: ${authBloc.state}');

  if (state.matchedLocation == '/unknown') {
    print('routerRedirect return /');
    return '/';
  }
  if (authBloc.state is AuthLoggedIn ||
      authBloc.state is AuthOnboardingRequired) {
    if (isLoggingInState(state)) {
      print('routerRedirect return /details');
      return '/details';
    }
  }
  print('routerRedirect return null');
  return null;
}

bool isLoggingInState(GoRouterState state) {
  return [RouteName.logIn.value, RouteName.signUp.value]
      .contains(state.matchedLocation.replaceAll('/', ''));
}
