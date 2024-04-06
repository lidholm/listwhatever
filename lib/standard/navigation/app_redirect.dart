import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/navigation/routes.dart';
import 'package:listwhatever/custom/pages/onboarding/onboarding_page_route.dart';
import 'package:listwhatever/standard/app/bloc/app_bloc.dart';
import 'package:listwhatever/standard/navigation/models/router_provider_information.dart';
import '/standard/app/bloc/app_state.dart';
import '/standard/constants.dart';
import '/standard/navigation/redirect_cubit.dart';

class AppRedirect {
  Future<String?> appRedirect(
    BuildContext context,
    GoRouterState state,
    RouterProviderInformation routerProviderInformation,
  ) async {
    logger.d('===================\n');
    final appBloc = BlocProvider.of<AppBloc>(context);
    final appState = appBloc.state;
    logger
      ..i('$this => state.uri.path: ${state.uri.path}')
      ..i('$this => appState: $appState   QQQ10');

    if (appState is OnboardingRequired) {
      logger.i('$this => redirectUri: OnboardingPage     QQQ11');
      return const OnboardingPageRoute().location;
    }

    if (appState is! LoggedInWithData) {
      if (routerProviderInformation.dontRequireLoginRouteLocations
          .any((pattern) => matchingDontRequireLoginPatterns(state, pattern))) {
        logger.i('$this => return null     QQQ12');
        return null;
      }
      final fromParam = context.read<RedirectCubit>().state ?? state.uri.path;
      // logger.d('fromParam: $fromParam');
      context.read<RedirectCubit>().setRedirect(fromParam);
      final redirectUri = routerProviderInformation.signInRouteLocation;
      logger.i('$this => redirectUri: $redirectUri    QQQ13');
      return redirectUri;
    }
    // no other redirects, check if 'from' is set and if so, redirect to it
    //   logger.d('no other redirects');
    final fromParam = context.read<RedirectCubit>().state;
    // logger.d('fromParam: $fromParam');
    if (fromParam != null) {
      context.read<RedirectCubit>().clear();
      logger.i('$this => fromParam: $fromParam    QQQ14');
      return fromParam;
    }

    logger.d('$this => returns null at end    QQQ15');
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
      final notRequired = regex.hasMatch(state.fullPath ?? 'notamatch-XYXYXYXYX');
      logger.d('$this => notRequired: $notRequired');
      return notRequired;
    } else {
      // logger.d('pattern: $pattern : ${pattern == state.location}');
      final notRequired = pattern == state.fullPath;
      logger.d('$this => notRequired: $notRequired');
      return notRequired;
    }
  }
}
