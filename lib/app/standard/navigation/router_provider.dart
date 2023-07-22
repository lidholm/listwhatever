import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '/app/standard/app_redirect.dart';
import '/app/standard/helpers/constants.dart';
import '/app/standard/navigation/router_provider_information.dart';
import '/app/standard/navigation/routes/error_loading_user_route.dart';
import '/app/standard/navigation/routes/loading_user_route.dart';
import '/app/standard/navigation/routes/routes.dart';
import '/app/standard/pages/about/about_page_route.dart';
import '/app/standard/pages/analytics/analytics_page_route.dart';
import '/app/standard/pages/crashlytics/crashlytics_page_route.dart';
import '/app/standard/pages/deleteAccount/delete_account_page_route.dart';
import '/app/standard/pages/firebase_in_app_messaging/firebase_in_app_messaging_page_route.dart';
import '/app/standard/pages/firebase_performance/performance_page_route.dart';
import '/app/standard/pages/privacyPolicy/privacy_policy_page_route.dart';
import '/app/standard/pages/remoteConfig/remote_config_page_route.dart';
import 'routes/sign_in_page_route.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    final routerProviderInformation = RouterProviderInformation(
      dontRequireLoginRouteLocations: [
        const PrivacyPolicyPageRoute().location,
        const AboutPageRoute().location,
        const DeleteAccountPageRoute().location,
        const CrashlyticstPageRoute().location,
        const AnalyticsPageRoute().location,
        const RemoteConfigPageRoute().location,
        const FirebaseInAppMessagingPageRoute().location,
        const PerformancePageRoute().location
      ],
      requireLoginRouteLocations: [],
      initialRouteLocation: MainPageRoute().location,
      signUpRouteLocation: 'notyet',
      signInRouteLocation: const SignInPageRoute().location,
      errorLoadingUserRouteLocation: const ErrorLoadingUserRoute().location,
      loadingUserRouteLocation: const LoadingUserRoute().location,
    );

    return GoRouter(
      initialLocation: routerProviderInformation.initialRouteLocation,
      //debugLogDiagnostics: true,
      routes: $appRoutes,
      navigatorKey: navKey,
      redirect: (context, state) async =>
          appRedirect(context, state, ref, routerProviderInformation),
    );
  },
);
