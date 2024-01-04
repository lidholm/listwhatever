import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '/standard/app/app.dart';
import '/standard/app/bloc/app_state.dart';
import '/standard/constants.dart';
import '/standard/navigation/redirect_cubit.dart';

import 'navigation.dart';

class AppRedirect {
  Future<String?> appRedirect(
    BuildContext context,
    GoRouterState state,
    RouterProviderInformation routerProviderInformation,
  ) async {
    logger.d('===================\n');
    final appBloc = BlocProvider.of<AppBloc>(context);
    final currentUser = appBloc.state;
    print('state.uri.path: ${state.uri.path}');
    logger.d('$this.currentUser: $currentUser');
    print('$this.currentUser: ${currentUser.user.id}');
    print('$this.currentUser: ${currentUser.user.email}');

    if (currentUser.status != AppStatus.authenticated) {
      if (routerProviderInformation.dontRequireLoginRouteLocations
          .any((pattern) => matchingDontRequireLoginPatterns(state, pattern))) {
        return null;
      }
      final fromParam = context.read<RedirectCubit>().state ?? state.uri.path;
      // logger.d('fromParam: $fromParam');
      context.read<RedirectCubit>().setRedirect(fromParam);
      final redirectUri = routerProviderInformation.signInRouteLocation;
      logger.d('$this.redirectUri: $redirectUri');
      print('$this.redirectUri: $redirectUri');
      return redirectUri;
    }
    // no other redirects, check if 'from' is set and if so, redirect to it
    //   logger.d('no other redirects');
    final fromParam = context.read<RedirectCubit>().state;
    // logger.d('fromParam: $fromParam');
    if (fromParam != null) {
      context.read<RedirectCubit>().clear();
      logger.d('$this.fromParam: $fromParam');
      print('$this.fromParam: $fromParam');
      return fromParam;
    }

    logger.d('$this.returns null');
    print('$this.returns null');
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
      logger.d('$this.notRequired: $notRequired');
      return notRequired;
    } else {
      // logger.d('pattern: $pattern : ${pattern == state.location}');
      final notRequired = pattern == state.fullPath;
      logger.d('$this.notRequired: $notRequired');
      return notRequired;
    }
  }
}
