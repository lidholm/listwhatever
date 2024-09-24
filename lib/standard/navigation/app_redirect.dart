import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/navigation/routes.dart';
import 'package:listwhatever/standard/page/login_page_route.dart';

import '/standard/app/bloc/app_bloc.dart';
import '/standard/app/bloc/app_state.dart';
import '/standard/constants.dart';
import '/standard/navigation/models/router_provider_information.dart';
import '/standard/navigation/redirect_cubit.dart';

class AppRedirect {
  static String className = 'AppRedirect';
  Future<String?> appRedirect(
    BuildContext context,
    GoRouterState state,
    RouterProviderInformation routerProviderInformation,
  ) async {
    logger.d('===================\n');
    final appBloc = BlocProvider.of<AppBloc>(context);
    final appState = appBloc.state;
    logger
      ..i('$className => state.uri.path: ${state.uri.path}')
      ..i('$className => appState: ${getFirstXChars(appState.toString(), 100)}   QQQ10');

    if (state.uri.path == const LoginPageRoute().location &&
        appState is LoggedOut) {
      logger.i(
        '$className => Onboarding is required. return ${routerProviderInformation.dontRequireLoginRouteLocations}     QQQ12',
      );
      return null;
    }

    if (appState is! LoggedInWithData) {
      if (appState is OnboardingRequired) {
        logger.i(
          '$className => Onboarding is required. return ${routerProviderInformation.dontRequireLoginRouteLocations}     QQQ12',
        );
        return routerProviderInformation.signUpRouteLocation;
      }

      if (routerProviderInformation.dontRequireLoginRouteLocations
          .any((pattern) => matchingDontRequireLoginPatterns(state, pattern))) {
        logger.i(
          '$className => Does not required to be logged in. return null     QQQ12',
        );
        return null;
      }
      final fromParam = context.read<RedirectCubit>().state ?? state.uri.path;
      // logger.d('fromParam: $fromParam');
      context.read<RedirectCubit>().setRedirect(fromParam);

      final redirectUri = routerProviderInformation.signInRouteLocation;
      logger.i('$className => redirectUri: $redirectUri    QQQ13');
      return redirectUri;
    }

    if (appState is LoggedOut) {
      logger.i(
        '$className => User is logged out. Take to log in page     QQQ12',
      );
      return routerProviderInformation.signInRouteLocation;
    }

    if (appState is OnboardingRequired) {
      final redirectUri = routerProviderInformation.signUpRouteLocation;
      logger.i(
        '$className => Sign up required. redirectUri: $redirectUri    QQQ13',
      );
      return redirectUri;
      // } else {
      //   logger.i(
      //     '$className => Logged in and onboarded redirect to : ${routerProviderInformation.initialRouteLocation}    QQQ13',
      //   );
      //   return routerProviderInformation.initialRouteLocation;
    }

    // no other redirects, check if 'from' is set and if so, redirect to it
    //   logger.d('no other redirects');
    final fromParam = context.read<RedirectCubit>().state;
    // logger.d('fromParam: $fromParam');
    if (fromParam != null) {
      context.read<RedirectCubit>().clear();
      logger.i('$className => fromParam: $fromParam    QQQ14');
      return fromParam;
    }

    logger.d('$className => returns null at end    QQQ15');
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
      logger.d('$className => notRequired: $notRequired');
      return notRequired;
    } else {
      // logger.d('pattern: $pattern : ${pattern == state.location}');
      final notRequired = pattern == state.fullPath;
      logger.d('$className => notRequired: $notRequired');
      return notRequired;
    }
  }
}
