import 'package:listanything/custom/navigation/routes.dart';
import 'package:listanything/standard/navigation/models/router_provider_information.dart';

RouterProviderInformation getRouterProviderInformation() {
  return RouterProviderInformation(
    dontRequireLoginRouteLocations: [
      MainPageRoute().location,
    ],
    requireLoginRouteLocations: [],
    initialRouteLocation: MainPageRoute().location,
    signUpRouteLocation: 'notyet',
    signInRouteLocation: MainPageRoute().location,
    errorLoadingUserRouteLocation: MainPageRoute().location,
    loadingUserRouteLocation: MainPageRoute().location,
  );
}
