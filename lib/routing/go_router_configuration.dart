import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/pages/auth/profile_page.dart';
import 'package:listwhatever/pages/auth/sign_up_options_page.dart';
import 'package:listwhatever/routing/details_screen.dart';
import 'package:listwhatever/routing/go_router_redirect.dart';
import 'package:listwhatever/routing/home_screen.dart';
import 'package:listwhatever/tab_bar/view/tab_bar_page.dart';

enum RouteName {
  home._('/details'),
  details._('submit'),
  tabBar._('tabBar'),
  signUp._('signUp'),
  logIn._('logIn'),
  profile._('profile');

  const RouteName._(this.value);

  final String value;
}

/// The route configuration.
final GoRouter goRouterConfiguration = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/${RouteName.signUp.value}',
  redirect: routerRedirect,
  routes: <RouteBase>[
    GoRoute(
      name: RouteName.home.value,
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          name: RouteName.details.value,
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
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
          path: 'signin',
          builder: (BuildContext context, GoRouterState state) {
            return const SignInOptionsPage();
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
