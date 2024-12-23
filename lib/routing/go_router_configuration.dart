import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/auth/bloc/auth_bloc.dart';
import 'package:listwhatever/pages/auth/log_in_options_page.dart';
import 'package:listwhatever/pages/auth/profile_page.dart';
import 'package:listwhatever/pages/auth/sign_up_options_page.dart';
import 'package:listwhatever/pages/list/pages/list_page.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';
import 'package:listwhatever/pages/lists/pages/add_list_page.dart';
import 'package:listwhatever/pages/lists/pages/lists_page.dart';
import 'package:listwhatever/routing/go_router_redirect.dart';
import 'package:listwhatever/routing/go_router_refresh_stream.dart';
import 'package:listwhatever/tab_bar/view/tab_bar_page.dart';

enum RouteName {
  home._('/'),
  list._('/list'),
  addList._('/addList'),
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
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const ListsPage();
        },
        routes: <RouteBase>[
          GoRoute(
            name: RouteName.list.value,
            path: 'list',
            builder: (BuildContext context, GoRouterState state) {
              return const ListPage(
                list: ListOfThings(
                  id: '',
                  name: 'Test list',
                  withMap: false,
                  withDates: false,
                  withTimes: false,
                  shared: false,
                  sharedWith: {},
                  ownerId: 'Super Mario',
                ),
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
