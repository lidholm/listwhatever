import 'package:listwhatever/custom/pages/onboarding/onboarding_page_route.dart';
import 'package:listwhatever/standard/user_profile/page/user_profile_page_route.dart';

import '/custom/navigation/routes.dart';
import '/custom/pages/lists/page/lists_page_route.dart';
import '/standard/navigation/models/router_provider_information.dart';
import '/standard/onScreenLog/on_screen_logs_page_route.dart';
import '/standard/page/login_page_route.dart';
import '/standard/page/login_with_email_and_password_page_route.dart';

RouterProviderInformation getRouterProviderInformation() {
  return RouterProviderInformation(
    dontRequireLoginRouteLocations: [
      const OnScreenLogsPageRoute().location,
      const LoginPageRoute().location,
      const LoginWithEmailAndPasswordPageRoute().location,
      const UserProfilePageRoute().location,
    ],
    requireLoginRouteLocations: [],
    initialRouteLocation: const ListsPageRoute().location,
    signUpRouteLocation: const OnboardingPageRoute().location,
    signInRouteLocation: const LoginPageRoute().location,
    errorLoadingUserRouteLocation: MainPageRoute().location,
    loadingUserRouteLocation: MainPageRoute().location,
  );
}
