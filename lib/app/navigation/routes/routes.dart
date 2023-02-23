import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/navigation/home_screen.dart';
import 'package:listanything/app/navigation/routes/counter_page_route.dart';
import 'package:listanything/app/navigation/routes/loading_user_route.dart';
import 'package:listanything/app/navigation/routes/sign_in_screen_route.dart';

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
