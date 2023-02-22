// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $counterPageRoute,
    ];

GoRoute get $counterPageRoute => GoRouteData.$route(
      path: '/',
      factory: $CounterPageRouteExtension._fromState,
    );

extension $CounterPageRouteExtension on CounterPageRoute {
  static CounterPageRoute _fromState(GoRouterState state) => CounterPageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}
