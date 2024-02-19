import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/pages/import/spreadsheet/spreadsheets_page_route.dart';
import 'package:listwhatever/custom/pages/lists/page/lists_page_route.dart';

import '/custom/pages/about/about_page_route.dart';
import '/custom/pages/crashlytics/crashlytics.dart';
import '/custom/pages/deleteAccount/delete_account_page_route.dart';
import '/custom/pages/firebase_in_app_messaging/firebase_in_app_messaging.dart';
import '/custom/pages/firebase_performance/firebase_performance.dart';
import '/custom/pages/home/home.dart';
import '/custom/pages/import/csv/import_csv_page_route.dart';
import '/custom/pages/listItems/addListItem/add_list_item_page_route.dart';
import '/custom/pages/listItems/addListItem/edit_list_item_page_route.dart';
import '/custom/pages/listItems/list_items_page_route.dart';
import '/custom/pages/listItems/searchLocation/search_location_page_route.dart';
import '/custom/pages/lists/addList/add_list.dart';
import '/custom/pages/lists/addList/edit_list_page_route.dart';
import '/custom/pages/privacyPolicy/privacy_policy_page_route.dart';
import '/custom/pages/remoteConfig/remote_config_page_route.dart';
import '/custom/pages/shareList/share_list_page_route.dart';
import '/custom/pages/subscribeList/subscribe_list_page_route.dart';
import '/standard/onScreenLog/on_screen_logs_page_route.dart';
import '/standard/page/login_page_route.dart';
import '/standard/page/login_with_email_and_password_page_route.dart';
import '/standard/user_profile/user_profile.dart';

part 'routes.g.dart';

@TypedGoRoute<MainPageRoute>(
  path: '/',
  routes: [
    TypedGoRoute<OnScreenLogsPageRoute>(
      path: 'logs',
      name: 'logs',
    ),
    TypedGoRoute<ListsPageRoute>(
      path: 'lists',
      name: 'lists',
      routes: [
        TypedGoRoute<SubscribeListPageRoute>(
          path: 'subscribe/:code',
          name: 'subscribe',
        ),
        TypedGoRoute<ListItemsPageRoute>(
          path: ':listId/items',
          name: 'items',
          routes: [
            TypedGoRoute<AddListItemPageRoute>(
              path: 'add',
              name: 'addListItem',
            ),
            TypedGoRoute<EditListItemPageRoute>(
              path: ':itemId/edit',
              name: 'editListItem',
            ),
          ],
        ),
        TypedGoRoute<AddListPageRoute>(
          path: 'add',
          name: 'addList',
        ),
        TypedGoRoute<EditListPageRoute>(
          path: ':listId/edit',
          name: 'editList',
        ),
        TypedGoRoute<ShareListPageRoute>(
          path: ':listId/share',
          name: 'share',
        ),
        TypedGoRoute<ImportCsvPageRoute>(
          path: ':listId/import/csv',
          name: 'importcsv',
        ),
        TypedGoRoute<SpreadsheetsPageRoute>(
          path: ':listId/import/spreadsheet',
          name: 'listasspreadsheet',
        ),
      ],
    ),
    TypedGoRoute<SearchLocationPageRoute>(
      path: 'search_location',
      name: 'search_location',
    ),
    TypedGoRoute<UserProfilePageRoute>(
      path: 'user_profile',
      name: 'user_profile',
    ),
    TypedGoRoute<LoginPageRoute>(
      path: 'login',
      name: 'login',
      routes: [
        TypedGoRoute<LoginWithEmailAndPasswordPageRoute>(
          path: 'email',
          name: 'login_email',
        ),
      ],
    ),
    TypedGoRoute<RemoteConfigPageRoute>(
      path: 'remoteconfig',
      name: 'remoteconfig',
    ),
    TypedGoRoute<AboutPageRoute>(
      path: 'about',
      name: 'about',
    ),
    TypedGoRoute<CrashlyticstPageRoute>(
      path: 'crashlytics',
      name: 'crashlytics',
    ),
    TypedGoRoute<DeleteAccountPageRoute>(
      path: 'deleteaccount',
      name: 'deleteaccount',
    ),
    TypedGoRoute<FirebasePerformancePageRoute>(
      path: 'firebaseperformance',
      name: 'firebaseperformance',
    ),
    TypedGoRoute<FirebaseInAppMessagingPageRoute>(
      path: 'firebaseinappmessaging',
      name: 'firebaseinappmessaging',
    ),
    TypedGoRoute<PrivacyPolicyPageRoute>(
      path: 'privacypolicy',
      name: 'privacypolicy',
    ),
  ],
)
@immutable
class MainPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}
