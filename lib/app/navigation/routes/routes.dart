import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/navigation/routes/about_page_route.dart';
import 'package:listanything/app/navigation/routes/add_list_item_route.dart';
import 'package:listanything/app/navigation/routes/add_list_route.dart';
import 'package:listanything/app/navigation/routes/edit_list_item_route.dart';
import 'package:listanything/app/navigation/routes/edit_list_route.dart';
import 'package:listanything/app/navigation/routes/filter_page_route.dart';
import 'package:listanything/app/navigation/routes/list_item_details_page_route.dart';
import 'package:listanything/app/navigation/routes/list_items_page_route.dart';
import 'package:listanything/app/navigation/routes/list_page_route.dart';
import 'package:listanything/app/navigation/routes/loading_user_route.dart';
import 'package:listanything/app/navigation/routes/privacy_policy_page_route.dart';
import 'package:listanything/app/navigation/routes/profile_page_route.dart';
import 'package:listanything/app/navigation/routes/search_location_for_add_page_route.dart';
import 'package:listanything/app/navigation/routes/search_location_for_edit_page_route.dart';
import 'package:listanything/app/navigation/routes/share_code_page_route.dart';
import 'package:listanything/app/navigation/routes/share_list_page_route.dart';
import 'package:listanything/app/navigation/routes/sign_in_screen_route.dart';

part 'routes.g.dart';

@TypedGoRoute<WelcomeRoute>(
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
    TypedGoRoute<ProfilePageRoute>(
      path: 'profile',
    ),
    TypedGoRoute<AboutPageRoute>(
      path: 'about',
    ),
    TypedGoRoute<PrivacyPolicyPageRoute>(
      path: 'privacypolicy',
    ),
  ],
)
@immutable
class WelcomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Text('Welcome');
  }
}
