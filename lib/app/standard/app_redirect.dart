import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '/app/standard/helpers/constants.dart';
import '/app/standard/navigation/current_user_provider.dart';
import '/app/standard/navigation/router_provider_information.dart';

Future<String?> appRedirect(
  BuildContext context,
  GoRouterState state,
  ProviderRef<Object?> ref,
  RouterProviderInformation routerProviderInformation,
) async {
  // and then use userChanges to check for changes to if a user is logged in or not
  logger.d('state.location: ${state.location}');

  if (routerProviderInformation.dontRequireLoginRouteLocations.any((pattern) {
    if (pattern.contains('*')) {
      final regex = RegExp(pattern);
      // print('pattern: $pattern : ${regex.hasMatch(state.location)}');
      return regex.hasMatch(state.location);
    } else {
      // print('pattern: $pattern : ${pattern == state.location}');
      return pattern == state.location;
    }
  })) {
    return null;
  }

  final userChanges = ref.watch(currentUserProvider);
  final path = userChanges.when(
    error: (e, st) {
      if (e is FirebaseException && e.code == 'permission-denied') {
        // return routerProviderInformation.signUpRouteLocation;
      }
      logger
        ..e(e)
        ..e(st);
      return routerProviderInformation.errorLoadingUserRouteLocation;
    },
    loading: () => routerProviderInformation.loadingUserRouteLocation,
    data: (user) {
      logger.d('router: user: $user');
      return user == null ? routerProviderInformation.signInRouteLocation : null;
    },
  );
  logger.d('going to. $path');
  return path;
}
