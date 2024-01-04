import '/custom/navigation/routes.dart';
import '/custom/pages/lists/lists.dart';
import '/standard/navigation/models/router_provider_information.dart';
import '/standard/onScreenLog/on_screen_logs_page_route.dart';
import '/standard/page/login_page_route.dart';
import '/standard/page/login_with_email_and_password_page_route.dart';

RouterProviderInformation getRouterProviderInformation() {
  return RouterProviderInformation(
    dontRequireLoginRouteLocations: [
      MainPageRoute().location,
      const OnScreenLogsPageRoute().location,
      const LoginPageRoute().location,
      const LoginWithEmailAndPasswordPageRoute().location,
    ],
    requireLoginRouteLocations: [],
    initialRouteLocation: const ListsPageRoute().location,
    signUpRouteLocation: 'notyet',
    // signInRouteLocation:  const LoginWithEmailAndPasswordPageRoute().location, // const LoginPageRoute().location,
    signInRouteLocation:  const LoginPageRoute().location,
    errorLoadingUserRouteLocation: MainPageRoute().location,
    loadingUserRouteLocation: MainPageRoute().location,
  );
}
