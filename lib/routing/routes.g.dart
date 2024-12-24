// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainPageRoute,
    ];

RouteBase get $mainPageRoute => GoRouteData.$route(
      path: '/',
      factory: $MainPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'lists',
          name: 'lists',
          factory: $ListsPageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: ':actualListId',
              name: 'items',
              factory: $ListPageRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'add',
                  name: 'addListItem',
                  factory: $AddListItemPageRouteExtension._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'add',
              name: 'addList',
              factory: $AddListPageRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'login',
          name: 'login',
          factory: $LoginPageRouteExtension._fromState,
        ),
      ],
    );

extension $MainPageRouteExtension on MainPageRoute {
  static MainPageRoute _fromState(GoRouterState state) => MainPageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ListsPageRouteExtension on ListsPageRoute {
  static ListsPageRoute _fromState(GoRouterState state) =>
      const ListsPageRoute();

  String get location => GoRouteData.$location(
        '/lists',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ListPageRouteExtension on ListPageRoute {
  static ListPageRoute _fromState(GoRouterState state) => ListPageRoute(
        actualListId: state.pathParameters['actualListId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(actualListId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddListItemPageRouteExtension on AddListItemPageRoute {
  static AddListItemPageRoute _fromState(GoRouterState state) =>
      AddListItemPageRoute(
        actualListId: state.pathParameters['actualListId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(actualListId)}/add',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddListPageRouteExtension on AddListPageRoute {
  static AddListPageRoute _fromState(GoRouterState state) =>
      const AddListPageRoute();

  String get location => GoRouteData.$location(
        '/lists/add',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginPageRouteExtension on LoginPageRoute {
  static LoginPageRoute _fromState(GoRouterState state) =>
      const LoginPageRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
