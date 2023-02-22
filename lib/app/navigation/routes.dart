import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterbase/app/navigation/home_screen.dart';
import 'package:flutterbase/app/navigation/loading_user_page.dart';
import 'package:flutterbase/app/pages/counter/counter_page.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeScreenRoute>(
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
  ],
)
@immutable
class HomeScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

@immutable
class LoadingUserRoute extends GoRouteData {
  const LoadingUserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoadingUserPage();
  }
}

@immutable
class SignInScreenRoute extends GoRouteData {
  const SignInScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInScreen();
  }
}

@immutable
class CounterPageRoute extends GoRouteData {
  const CounterPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CounterPage();
  }
}
