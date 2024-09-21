import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
      ..i('$className => appState: $appState   QQQ10');

    if (appState is! LoggedInWithData) {
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

      if (appState is LoggedIn) {
        final redirectUri = routerProviderInformation.signUpRouteLocation;
        logger.i(
          '$className => Sign up required. redirectUri: $redirectUri    QQQ13',
        );
        return redirectUri;
      }

      final redirectUri = routerProviderInformation.signInRouteLocation;
      logger.i('$className => redirectUri: $redirectUri    QQQ13');
      return redirectUri;
    }

    if (appState is OnboardingRequired) {
      final redirectUri = routerProviderInformation.signUpRouteLocation;
      logger.i(
        '$className => Sign up required. redirectUri: $redirectUri    QQQ13',
      );
      return redirectUri;
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
