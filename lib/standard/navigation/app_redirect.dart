import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/navigation/routes.dart';
import 'package:listwhatever/standard/page/login_page_route.dart';

import '/standard/app/bloc/app_bloc.dart';
import '/standard/app/bloc/app_state.dart';
import '/standard/navigation/models/router_provider_information.dart';
import '/standard/navigation/redirect_cubit.dart';

class AppRedirect {
  static String className = 'AppRedirect';
  Future<String?> appRedirect(
    BuildContext context,
    GoRouterState state,
    RouterProviderInformation routerProviderInformation,
  ) async {
    //
    final appBloc = BlocProvider.of<AppBloc>(context);
    final appState = appBloc.state;

    if (state.uri.path == const LoginPageRoute().location &&
        appState is LoggedOut) {
      return null;
    }

    if (appState is! LoggedInWithData) {
      if (appState is OnboardingRequired) {
        return routerProviderInformation.signUpRouteLocation;
      }

      if (routerProviderInformation.dontRequireLoginRouteLocations
          .any((pattern) => matchingDontRequireLoginPatterns(state, pattern))) {
        return null;
      }
      final fromParam = context.read<RedirectCubit>().state ?? state.uri.path;
      //
      context.read<RedirectCubit>().setRedirect(fromParam);

      if (appState is! LoggedIn) {
        final redirectUri = routerProviderInformation.signInRouteLocation;

        return redirectUri;
      }
    }

    if (appState is LoggedOut) {
      return routerProviderInformation.signInRouteLocation;
    }

    if (appState is OnboardingRequired) {
      final redirectUri = routerProviderInformation.signUpRouteLocation;
      return redirectUri;
      // } else {
      //
      //     '$className => Logged in and onboarded redirect to : ${routerProviderInformation.initialRouteLocation}    QQQ13',
      //   );
      //   return routerProviderInformation.initialRouteLocation;
    }

    // no other redirects, check if 'from' is set and if so, redirect to it
    //
    final fromParam = context.read<RedirectCubit>().state;
    //
    if (fromParam != null) {
      context.read<RedirectCubit>().clear();

      return fromParam;
    }

    return null;
  }

  String getFirstXChars(String s, int x) {
    if (s.length > x) {
      return s.substring(0, x);
    } else {
      return s.substring(0, s.length);
    }
  }

  String expandFullPath(GoRouterState state) {
    var fullPath = state.fullPath!;
    for (final param in state.pathParameters.entries) {
      fullPath = fullPath.replaceAll(':${param.key}', param.value);
    }
    return fullPath;
  }

  @override
  String toString() {
    return 'AppRedirect';
  }

  bool matchingDontRequireLoginPatterns(GoRouterState state, String pattern) {
    if (pattern.contains('*')) {
      final regex = RegExp(pattern);
      final notRequired =
          regex.hasMatch(state.fullPath ?? 'notamatch-XYXYXYXYX');

      return notRequired;
    } else {
      //
      final notRequired = pattern == state.fullPath;

      return notRequired;
    }
  }
}
