import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/navigation/routes/about_page_route.dart';
import 'package:listanything/app/navigation/routes/add_list_item_route.dart';
import 'package:listanything/app/navigation/routes/add_list_route.dart';
import 'package:listanything/app/navigation/routes/analytics_page_route.dart';
import 'package:listanything/app/navigation/routes/crashlytics_page_route.dart';
import 'package:listanything/app/navigation/routes/edit_list_item_route.dart';
import 'package:listanything/app/navigation/routes/edit_list_route.dart';
import 'package:listanything/app/navigation/routes/error_loading_user_route.dart';
import 'package:listanything/app/navigation/routes/filter_page_route.dart';
import 'package:listanything/app/navigation/routes/list_item_details_page_route.dart';
import 'package:listanything/app/navigation/routes/list_items_page_route.dart';
import 'package:listanything/app/navigation/routes/list_page_route.dart';
import 'package:listanything/app/navigation/routes/loading_user_route.dart';
import 'package:listanything/app/navigation/routes/privacy_policy_page_route.dart';
import 'package:listanything/app/navigation/routes/profile_page_route.dart';
import 'package:listanything/app/navigation/routes/remote_config_page_route.dart';
import 'package:listanything/app/navigation/routes/search_location_for_add_page_route.dart';
import 'package:listanything/app/navigation/routes/search_location_for_edit_page_route.dart';
import 'package:listanything/app/navigation/routes/settings_page_route.dart';
import 'package:listanything/app/navigation/routes/share_code_page_route.dart';
import 'package:listanything/app/navigation/routes/share_list_page_route.dart';
import 'package:listanything/app/navigation/routes/sign_in_screen_route.dart';
import 'package:listanything/app/navigation/routes/sign_up_user_page_route.dart';
import 'package:listanything/app/pages/lists/lists_page.dart';
part 'routes.g.dart';

@TypedGoRoute<MainPageRoute>(
  path: '/',
  routes: [
    TypedGoRoute<LoadingUserRoute>(
      path: 'loading_user',
    ),
    TypedGoRoute<SignInScreenRoute>(
      path: 'sign_in',
    ),
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
    TypedGoRoute<SettingsPageRoute>(
      path: 'settings',
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
  ],
)
@immutable
class MainPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ListsPage();
  }
}
