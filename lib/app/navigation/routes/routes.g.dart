// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $homeScreenRoute,
    ];

GoRoute get $homeScreenRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeScreenRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'loading_user',
          factory: $LoadingUserRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'sign_in',
          factory: $SignInScreenRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'counter',
          factory: $CounterPageRouteExtension._fromState,
        ),
      ],
    );

extension $HomeScreenRouteExtension on HomeScreenRoute {
  static HomeScreenRoute _fromState(GoRouterState state) => HomeScreenRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $LoadingUserRouteExtension on LoadingUserRoute {
  static LoadingUserRoute _fromState(GoRouterState state) =>
      const LoadingUserRoute();

  String get location => GoRouteData.$location(
        '/loading_user',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $SignInScreenRouteExtension on SignInScreenRoute {
  static SignInScreenRoute _fromState(GoRouterState state) =>
      const SignInScreenRoute();

  String get location => GoRouteData.$location(
        '/sign_in',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $CounterPageRouteExtension on CounterPageRoute {
  static CounterPageRoute _fromState(GoRouterState state) =>
      const CounterPageRoute();

  String get location => GoRouteData.$location(
        '/counter',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}
