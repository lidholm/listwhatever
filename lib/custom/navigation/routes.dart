import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/custom/pages/about/about_page_route.dart';
import 'package:listanything/custom/pages/crashlytics/crashlytics.dart';
import 'package:listanything/custom/pages/deleteAccount/delete_account_page_route.dart';
import 'package:listanything/custom/pages/firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:listanything/custom/pages/firebase_performance/firebase_performance.dart';
import 'package:listanything/custom/pages/home/home.dart';
import 'package:listanything/custom/pages/listItems/addListItem/add_list_item_page_route.dart';
import 'package:listanything/custom/pages/listItems/addListItem/edit_list_item_page_route.dart';
import 'package:listanything/custom/pages/listItems/list_items_page_route.dart';
import 'package:listanything/custom/pages/listItems/searchLocation/search_location_page_route.dart';
import 'package:listanything/custom/pages/lists/addList/add_list.dart';
import 'package:listanything/custom/pages/lists/addList/edit_list_page_route.dart';
import 'package:listanything/custom/pages/lists/lists.dart';
import 'package:listanything/custom/pages/maps/maps_page_route.dart';
import 'package:listanything/custom/pages/privacyPolicy/privacy_policy_page_route.dart';
import 'package:listanything/custom/pages/remoteConfig/remote_config_page_route.dart';
import 'package:listanything/standard/login/page/login_with_email_and_password_page_route.dart';
import 'package:listanything/standard/user_profile/user_profile.dart';

part 'routes.g.dart';

@TypedGoRoute<MainPageRoute>(
  path: '/',
  routes: [
    TypedGoRoute<MapsPageRoute>(
      path: 'maps',
      name: 'maps',
    ),
    TypedGoRoute<ListsPageRoute>(
      path: 'lists',
      name: 'lists',
      routes: [
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
    TypedGoRoute<LoginWithEmailAndPasswordPageRoute>(
      path: 'login/email',
      name: 'login/email',
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
