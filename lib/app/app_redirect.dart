import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/navigation/current_user_provider.dart';
import 'package:listanything/app/navigation/router_provider_information.dart';

Future<String?> appRedirect(
  BuildContext context,
  GoRouterState state,
  ProviderRef<Object?> ref,
  RouterProviderInformation routerProviderInformation,
) async {
  logger.d('state.fullpath: ${state.fullpath}');
  // and then use userChanges to check for changes to if a user is logged in or not

  if (routerProviderInformation.dontRequireLoginRouteLocations
      .contains(state.location)) {
    return null;
  }

  logger.d('state.location: ${state.location}');

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
      return user == null
          ? routerProviderInformation.signInRouteLocation
          : null;
    },
  );
  logger.d('going to. $path');
  return path;
}
