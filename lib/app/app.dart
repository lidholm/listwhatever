import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/app_redirect.dart';
import 'package:listanything/app/common_theme_data.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/navigation/router_provider_information.dart';
import 'package:listanything/app/navigation/routes/about_page_route.dart';
import 'package:listanything/app/navigation/routes/error_loading_user_route.dart';
import 'package:listanything/app/navigation/routes/loading_user_route.dart';
import 'package:listanything/app/navigation/routes/privacy_policy_page_route.dart';
import 'package:listanything/app/navigation/routes/routes.dart';
import 'package:listanything/app/navigation/routes/sign_in_screen_route.dart';
import 'package:listanything/app/pages/map/location_provider.dart';
import 'package:listanything/l10n/l10n.dart';

final providers = [EmailAuthProvider()];

final routerProvider = Provider.family<GoRouter, RouterProviderInformation>(
  (ref, routerProviderInformation) => GoRouter(
    initialLocation: routerProviderInformation.initialRouteLocation,
    //debugLogDiagnostics: true,
    routes: $appRoutes,
    navigatorKey: navKey,
    redirect: (context, state) async =>
        appRedirect(context, state, ref, routerProviderInformation),
  ),
);

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerProviderInformation = RouterProviderInformation(
      dontRequireLoginRouteLocations: [
        const PrivacyPolicyPageRoute().location,
        const AboutPageRoute().location
      ],
      requireLoginRouteLocations: [],
      initialRouteLocation: MainPageRoute().location,
      signUpRouteLocation: 'notyet',
      signInRouteLocation: const SignInScreenRoute().location,
      errorLoadingUserRouteLocation: const ErrorLoadingUserRoute().location,
      loadingUserRouteLocation: const LoadingUserRoute().location,
    );

    final router = ref.watch(routerProvider(routerProviderInformation));
    preloadLocation(ref);
    return MaterialApp.router(
      routerConfig: router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      theme: commonThemeData,
    );
  }

  void preloadLocation(WidgetRef ref) {
    // Call locationProvider here so that it is loaded later when needed
    final location = ref.watch(locationProvider);
    print('location: $location');
  }
}
