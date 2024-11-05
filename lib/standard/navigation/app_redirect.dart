import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/navigation/routes.dart';
import 'package:listwhatever/standard/helpers/logger_helper.dart';
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
    // LoggerHelper.logger.d('===================\n');
    final appBloc = BlocProvider.of<AppBloc>(context);
    final appState = appBloc.state;
    LoggerHelper.logger
      ..i('$className => state.uri.path: ${state.uri.path}   QQQ99')
      ..i('$className => appState: ${getFirstXChars(appState.toString(), 100)}   QQQ10');

    if (state.uri.path == const LoginPageRoute().location &&
        appState is LoggedOut) {
      LoggerHelper.logger.i(
        '$className => Onboarding is required. return ${routerProviderInformation.dontRequireLoginRouteLocations}     QQQ12',
      );
      return null;
    }

    LoggerHelper.logger.i('$className: appState: $appState');
    if (appState is! LoggedInWithData) {
      if (appState is OnboardingRequired) {
        LoggerHelper.logger.i(
          '$className => Onboarding is required. return ${routerProviderInformation.dontRequireLoginRouteLocations}     QQQ12',
        );
        return routerProviderInformation.signUpRouteLocation;
      }

      if (routerProviderInformation.dontRequireLoginRouteLocations
          .any((pattern) => matchingDontRequireLoginPatterns(state, pattern))) {
        LoggerHelper.logger.i(
          '$className => Does not required to be logged in. return null     QQQ12',
        );
        return null;
      }
      final fromParam = context.read<RedirectCubit>().state ?? state.uri.path;
      // LoggerHelper.logger.d('fromParam: $fromParam');
      context.read<RedirectCubit>().setRedirect(fromParam);

      if (appState is! LoggedIn) {
        final redirectUri = routerProviderInformation.signInRouteLocation;
        LoggerHelper.logger
            .i('$className => redirectUri: $redirectUri    QQQ13');
        return redirectUri;
      }
    }

    if (appState is LoggedOut) {
      LoggerHelper.logger.i(
        '$className => User is logged out. Take to log in page     QQQ12',
      );
      return routerProviderInformation.signInRouteLocation;
    }

    if (appState is OnboardingRequired) {
      final redirectUri = routerProviderInformation.signUpRouteLocation;
      LoggerHelper.logger.i(
        '$className => Sign up required. redirectUri: $redirectUri    QQQ13',
      );
      return redirectUri;
      // } else {
      //   LoggerHelper.logger.i(
      //     '$className => Logged in and onboarded redirect to : ${routerProviderInformation.initialRouteLocation}    QQQ13',
      //   );
      //   return routerProviderInformation.initialRouteLocation;
    }

    // no other redirects, check if 'from' is set and if so, redirect to it
    //   LoggerHelper.logger.d('no other redirects');
    final fromParam = context.read<RedirectCubit>().state;
    // LoggerHelper.logger.d('fromParam: $fromParam');
    if (fromParam != null) {
      context.read<RedirectCubit>().clear();
      LoggerHelper.logger.i('$className => fromParam: $fromParam    QQQ14');
      return fromParam;
    }

    LoggerHelper.logger.d('$className => returns null at end    QQQ15');
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
      LoggerHelper.logger.d('$className => notRequired: $notRequired');
      return notRequired;
    } else {
      // LoggerHelper.logger.d('pattern: $pattern : ${pattern == state.location}');
      final notRequired = pattern == state.fullPath;
      LoggerHelper.logger.d('$className => notRequired: $notRequired');
      return notRequired;
    }
  }
}
