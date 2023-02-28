// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $listsPageRoute,
    ];

GoRoute get $listsPageRoute => GoRouteData.$route(
      path: '/',
      factory: $ListsPageRouteExtension._fromState,
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
        GoRouteData.$route(
          path: 'addoreditlist',
          factory: $AddOrEditListRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'listitems',
          factory: $ListItemsPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'addoreditlistitem',
          factory: $AddOrEditListItemRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'searchlocation',
          factory: $SearchLocationPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'profile',
          factory: $ProfilePageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'about',
          factory: $AboutPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'filter',
          factory: $FilterPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'map',
          factory: $MapsPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'privacypolicy',
          factory: $PrivacyPolicyPageRouteExtension._fromState,
        ),
      ],
    );

extension $ListsPageRouteExtension on ListsPageRoute {
  static ListsPageRoute _fromState(GoRouterState state) => ListsPageRoute();

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

extension $AddOrEditListRouteExtension on AddOrEditListRoute {
  static AddOrEditListRoute _fromState(GoRouterState state) =>
      const AddOrEditListRoute();

  String get location => GoRouteData.$location(
        '/addoreditlist',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $ListItemsPageRouteExtension on ListItemsPageRoute {
  static ListItemsPageRoute _fromState(GoRouterState state) =>
      const ListItemsPageRoute();

  String get location => GoRouteData.$location(
        '/listitems',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $AddOrEditListItemRouteExtension on AddOrEditListItemRoute {
  static AddOrEditListItemRoute _fromState(GoRouterState state) =>
      const AddOrEditListItemRoute();

  String get location => GoRouteData.$location(
        '/addoreditlistitem',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $SearchLocationPageRouteExtension on SearchLocationPageRoute {
  static SearchLocationPageRoute _fromState(GoRouterState state) =>
      SearchLocationPageRoute(
        searchPhrase: state.queryParams['search-phrase'],
      );

  String get location => GoRouteData.$location(
        '/searchlocation',
        queryParams: {
          if (searchPhrase != null) 'search-phrase': searchPhrase!,
        },
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $ProfilePageRouteExtension on ProfilePageRoute {
  static ProfilePageRoute _fromState(GoRouterState state) =>
      const ProfilePageRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $AboutPageRouteExtension on AboutPageRoute {
  static AboutPageRoute _fromState(GoRouterState state) =>
      const AboutPageRoute();

  String get location => GoRouteData.$location(
        '/about',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $FilterPageRouteExtension on FilterPageRoute {
  static FilterPageRoute _fromState(GoRouterState state) =>
      const FilterPageRoute();

  String get location => GoRouteData.$location(
        '/filter',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $MapsPageRouteExtension on MapsPageRoute {
  static MapsPageRoute _fromState(GoRouterState state) => const MapsPageRoute();

  String get location => GoRouteData.$location(
        '/map',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $PrivacyPolicyPageRouteExtension on PrivacyPolicyPageRoute {
  static PrivacyPolicyPageRoute _fromState(GoRouterState state) =>
      const PrivacyPolicyPageRoute();

  String get location => GoRouteData.$location(
        '/privacypolicy',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}
