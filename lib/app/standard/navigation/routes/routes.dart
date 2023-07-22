import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/app/custom/pages/lists/lists_page.dart';
import '/app/standard/navigation/routes/add_list_item_route.dart';
import '/app/standard/navigation/routes/add_list_route.dart';
import '/app/standard/navigation/routes/edit_list_item_route.dart';
import '/app/standard/navigation/routes/edit_list_route.dart';
import '/app/standard/navigation/routes/error_loading_user_route.dart';
import '/app/standard/navigation/routes/filter_page_route.dart';
import '/app/standard/navigation/routes/list_item_details_page_route.dart';
import '/app/standard/navigation/routes/list_items_page_route.dart';
import '/app/standard/navigation/routes/list_page_route.dart';
import '/app/standard/navigation/routes/loading_user_route.dart';
import '/app/standard/navigation/routes/profile_page_route.dart';
import '/app/standard/navigation/routes/search_location_for_add_page_route.dart';
import '/app/standard/navigation/routes/search_location_for_edit_page_route.dart';
import '/app/standard/navigation/routes/share_code_page_route.dart';
import '/app/standard/navigation/routes/share_list_page_route.dart';
import '/app/standard/pages/about/about_page_route.dart';
import '/app/standard/pages/analytics/analytics_page_route.dart';
import '/app/standard/pages/crashlytics/crashlytics_page_route.dart';
import '/app/standard/pages/deleteAccount/delete_account_page_route.dart';
import '/app/standard/pages/firebase_in_app_messaging/firebase_in_app_messaging_page_route.dart';
import '/app/standard/pages/firebase_performance/performance_page_route.dart';
import '/app/standard/pages/privacyPolicy/privacy_policy_page_route.dart';
import '/app/standard/pages/remoteConfig/remote_config_page_route.dart';
import '/app/standard/pages/sign_up_user/sign_up_user_page_route.dart';
import 'sign_in_page_route.dart';

part 'routes.g.dart';

@TypedGoRoute<MainPageRoute>(
  path: '/',
  routes: [
    TypedGoRoute<DeleteAccountPageRoute>(
      path: 'deleteaccount',
    ),
    TypedGoRoute<LoadingUserRoute>(
      path: 'loading_user',
    ),
    TypedGoRoute<SignInPageRoute>(
      path: 'sign_in',
    ),
    TypedGoRoute<ErrorLoadingUserRoute>(
      path: 'errorloadinguser',
    ),
    TypedGoRoute<ProfilePageRoute>(
      path: 'profile',
    ),
    TypedGoRoute<AboutPageRoute>(
      path: 'about',
    ),
    TypedGoRoute<PrivacyPolicyPageRoute>(
      path: 'privacypolicy',
    ),
    TypedGoRoute<CrashlyticstPageRoute>(
      path: 'crashlytics',
    ),
    TypedGoRoute<RemoteConfigPageRoute>(
      path: 'remote_config',
    ),
    TypedGoRoute<AnalyticsPageRoute>(
      path: 'analytics',
    ),

    TypedGoRoute<PerformancePageRoute>(
      path: 'performance',
    ),
    TypedGoRoute<FirebaseInAppMessagingPageRoute>(
      path: 'inappmessaging',
    ),

    // Custom routes

    TypedGoRoute<ListsPageRoute>(
      path: 'lists',
      routes: [
        TypedGoRoute<SignUpUserPageRoute>(
          path: 'signup',
        ),
        TypedGoRoute<ShareListPageRoute>(
          path: ':publicListId/share',
        ),
        TypedGoRoute<ShareCodePageRoute>(
          path: ':publicListId/shareCode/:shareCode',
        ),
        TypedGoRoute<AddListRoute>(
          path: 'add',
        ),
        TypedGoRoute<EditListRoute>(
          path: ':publicListId/edit',
        ),
        TypedGoRoute<ListItemsPageRoute>(
          path: ':publicListId/items',
          routes: [
            TypedGoRoute<EditListItemRoute>(
              path: ':listItemId/edit',
              routes: [
                TypedGoRoute<SearchLocationForEditPageRoute>(
                  path: 'searchlocation',
                ),
              ],
            ),
            TypedGoRoute<AddListItemRoute>(
              path: 'add',
              routes: [
                TypedGoRoute<SearchLocationForAddPageRoute>(
                  path: 'searchlocation',
                ),
              ],
            ),
            TypedGoRoute<ListItemDetailsPageRoute>(
              path: ':listItemId/details',
            ),
            TypedGoRoute<FilterPageRoute>(
              path: 'filter',
            ),
          ],
        ),
      ],
    ),
  ],
)
@immutable
class MainPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ListsPage();
  }
}
