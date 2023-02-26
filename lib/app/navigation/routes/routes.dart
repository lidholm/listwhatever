import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/navigation/routes/about_page_route.dart';
import 'package:listanything/app/navigation/routes/add_or_edit_list_item_route.dart';
import 'package:listanything/app/navigation/routes/add_or_edit_list_route.dart';
import 'package:listanything/app/navigation/routes/counter_page_route.dart';
import 'package:listanything/app/navigation/routes/filter_page_route.dart';
import 'package:listanything/app/navigation/routes/list_items_page_route.dart';
import 'package:listanything/app/navigation/routes/loading_user_route.dart';
import 'package:listanything/app/navigation/routes/profile_page_route.dart';
import 'package:listanything/app/navigation/routes/sign_in_screen_route.dart';
import 'package:listanything/app/pages/lists/lists_page.dart';

part 'routes.g.dart';

@TypedGoRoute<ListsPageRoute>(
  path: '/',
  routes: [
    TypedGoRoute<LoadingUserRoute>(
      path: 'loading_user',
    ),
    TypedGoRoute<SignInScreenRoute>(
      path: 'sign_in',
    ),
    TypedGoRoute<CounterPageRoute>(
      path: 'counter',
    ),
    TypedGoRoute<AddOrEditListRoute>(
      path: 'addoreditlist',
    ),
    TypedGoRoute<ListItemsPageRoute>(
      path: 'listitems',
    ),
    TypedGoRoute<AddOrEditListItemRoute>(
      path: 'addoreditlistitem',
    ),
    TypedGoRoute<ProfilePageRoute>(
      path: 'profile',
    ),
    TypedGoRoute<AboutPageRoute>(
      path: 'about',
    ),
    TypedGoRoute<FilterPageRoute>(
      path: 'filter',
    ),
  ],
)
@immutable
class ListsPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ListsPage();
  }
}
