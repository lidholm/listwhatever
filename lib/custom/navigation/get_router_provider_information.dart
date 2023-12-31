import 'package:listanything/custom/navigation/routes.dart';
import 'package:listanything/custom/pages/lists/lists.dart';
import 'package:listanything/standard/navigation/models/router_provider_information.dart';
import 'package:listanything/standard/page/login_page_route.dart';
import 'package:listanything/standard/page/login_with_email_and_password_page_route.dart';

RouterProviderInformation getRouterProviderInformation() {
  return RouterProviderInformation(
    dontRequireLoginRouteLocations: [
      MainPageRoute().location,
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
