import 'package:listwhatever/custom/pages/import/spreadsheet/list_as_spreadsheets_page_route.dart';
import 'package:listwhatever/custom/pages/lists/page/lists_page_route.dart';

import '/custom/navigation/routes.dart';
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
    ],
    requireLoginRouteLocations: [],
    initialRouteLocation: const ListAsSpreadsheetsPageRoute('tEGHI3eAyCs6ZYrXXB6D').location,
    signUpRouteLocation: 'notyet',
    signInRouteLocation: const LoginPageRoute().location,
    errorLoadingUserRouteLocation: MainPageRoute().location,
    loadingUserRouteLocation: MainPageRoute().location,
  );
}
