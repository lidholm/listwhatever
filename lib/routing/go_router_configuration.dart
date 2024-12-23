import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/auth/bloc/auth_bloc.dart';
import 'package:listwhatever/pages/auth/log_in_options_page.dart';
import 'package:listwhatever/pages/auth/profile_page.dart';
import 'package:listwhatever/pages/auth/sign_up_options_page.dart';
import 'package:listwhatever/pages/list/pages/add_list_item_page.dart';
import 'package:listwhatever/pages/list/pages/list_page.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';
import 'package:listwhatever/pages/lists/pages/add_list_page.dart';
import 'package:listwhatever/pages/lists/pages/lists_page.dart';
import 'package:listwhatever/routing/go_router_redirect.dart';
import 'package:listwhatever/routing/go_router_refresh_stream.dart';
import 'package:listwhatever/tab_bar/view/tab_bar_page.dart';

enum RouteName {
  home._('lists'),
  list._('list'),
  addList._('addList'),
  addListItem._('addListItem'),
  details._('submit'),
  tabBar._('tabbar'),
  signUp._('signup'),
  logIn._('login'),
  profile._('profile');

  const RouteName._(this.value);

  final String value;
}

/// The route configuration.
GoRouter getGoRouterConfiguration(BuildContext context) {
  return GoRouter(
    refreshListenable: GoRouterRefreshStream([
      BlocProvider.of<AuthBloc>(context).stream,
    ]),
    debugLogDiagnostics: true,
    initialLocation: '/${RouteName.home.value}',
    redirect: routerRedirect,
    routes: <RouteBase>[
      GoRoute(
        name: RouteName.home.value,
        path: '/lists',
        builder: (BuildContext context, GoRouterState state) {
          return const ListsPage();
        },
        routes: <RouteBase>[
          GoRoute(
            name: RouteName.list.value,
            path: '/:id',
            builder: (BuildContext context, GoRouterState state) {
              return ListPage(
                listId: state.pathParameters['id']!,
              );
            },
          ),
          GoRoute(
            name: RouteName.addList.value,
            path: 'addList',
            builder: (BuildContext context, GoRouterState state) {
              return const AddListPage();
            },
          ),
          GoRoute(
            name: RouteName.addListItem.value,
            path: 'addListItem',
            builder: (BuildContext context, GoRouterState state) {
              return const AddListItemPage();
            },
          ),
          GoRoute(
            name: RouteName.tabBar.name,
            path: 'tabbar',
            builder: (BuildContext context, GoRouterState state) {
              return const TabBarPage();
            },
          ),
          GoRoute(
            name: RouteName.signUp.value,
            path: 'signup',
            builder: (BuildContext context, GoRouterState state) {
              return const SignInOptionsPage();
            },
          ),
          GoRoute(
            name: RouteName.logIn.value,
            path: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return const LogInOptionsPage();
            },
          ),
          GoRoute(
            name: RouteName.profile.value,
            path: 'profile',
            builder: (BuildContext context, GoRouterState state) {
              return const ProfilePage();
            },
          ),
        ],
      ),
    ],
  );
}
