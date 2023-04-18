// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $welcomeRoute,
    ];

GoRoute get $welcomeRoute => GoRouteData.$route(
      path: '/',
      factory: $WelcomeRouteExtension._fromState,
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
          path: 'lists',
          factory: $ListsPageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: ':publicListId/share',
              factory: $ShareListPageRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: ':publicListId/shareCode/:shareCode',
              factory: $ShareCodePageRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'add',
              factory: $AddListRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: ':publicListId/edit',
              factory: $EditListRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: ':publicListId/map',
              factory: $MapsPageRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: ':publicListId/items',
              factory: $ListItemsPageRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: ':listItemId/edit',
                  factory: $EditListItemRouteExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'searchlocation',
                      factory:
                          $SearchLocationForEditPageRouteExtension._fromState,
                    ),
                  ],
                ),
                GoRouteData.$route(
                  path: 'add',
                  factory: $AddListItemRouteExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'searchlocation',
                      factory:
                          $SearchLocationForAddPageRouteExtension._fromState,
                    ),
                  ],
                ),
                GoRouteData.$route(
                  path: ':listItemId/details',
                  factory: $ListItemDetailsPageRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'filter',
                  factory: $FilterPageRouteExtension._fromState,
                ),
              ],
            ),
          ],
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
          path: 'privacypolicy',
          factory: $PrivacyPolicyPageRouteExtension._fromState,
        ),
      ],
    );

extension $WelcomeRouteExtension on WelcomeRoute {
  static WelcomeRoute _fromState(GoRouterState state) => WelcomeRoute();

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

extension $ListsPageRouteExtension on ListsPageRoute {
  static ListsPageRoute _fromState(GoRouterState state) => ListsPageRoute();

  String get location => GoRouteData.$location(
        '/lists',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $ShareListPageRouteExtension on ShareListPageRoute {
  static ShareListPageRoute _fromState(GoRouterState state) =>
      ShareListPageRoute(
        publicListId: state.params['publicListId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/share',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $ShareCodePageRouteExtension on ShareCodePageRoute {
  static ShareCodePageRoute _fromState(GoRouterState state) =>
      ShareCodePageRoute(
        publicListId: state.params['publicListId']!,
        shareCode: state.params['shareCode']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/shareCode/${Uri.encodeComponent(shareCode)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $AddListRouteExtension on AddListRoute {
  static AddListRoute _fromState(GoRouterState state) => const AddListRoute();

  String get location => GoRouteData.$location(
        '/lists/add',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $EditListRouteExtension on EditListRoute {
  static EditListRoute _fromState(GoRouterState state) => EditListRoute(
        publicListId: state.queryParams['public-list-id'],
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId!)}/edit',
        queryParams: {
          if (publicListId != null) 'public-list-id': publicListId!,
        },
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $MapsPageRouteExtension on MapsPageRoute {
  static MapsPageRoute _fromState(GoRouterState state) => MapsPageRoute(
        publicListId: state.params['publicListId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/map',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $ListItemsPageRouteExtension on ListItemsPageRoute {
  static ListItemsPageRoute _fromState(GoRouterState state) =>
      ListItemsPageRoute(
        publicListId: state.params['publicListId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/items',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $EditListItemRouteExtension on EditListItemRoute {
  static EditListItemRoute _fromState(GoRouterState state) => EditListItemRoute(
        publicListId: state.params['publicListId']!,
        listItemId: state.queryParams['list-item-id'],
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/items/${Uri.encodeComponent(listItemId!)}/edit',
        queryParams: {
          if (listItemId != null) 'list-item-id': listItemId!,
        },
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $SearchLocationForEditPageRouteExtension
    on SearchLocationForEditPageRoute {
  static SearchLocationForEditPageRoute _fromState(GoRouterState state) =>
      SearchLocationForEditPageRoute(
        publicListId: state.params['publicListId']!,
        searchPhrase: state.queryParams['search-phrase'],
        listItemId: state.queryParams['list-item-id'],
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/items/${Uri.encodeComponent(listItemId!)}/edit/searchlocation',
        queryParams: {
          if (searchPhrase != null) 'search-phrase': searchPhrase!,
          if (listItemId != null) 'list-item-id': listItemId!,
        },
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $AddListItemRouteExtension on AddListItemRoute {
  static AddListItemRoute _fromState(GoRouterState state) => AddListItemRoute(
        publicListId: state.params['publicListId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/items/add',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $SearchLocationForAddPageRouteExtension
    on SearchLocationForAddPageRoute {
  static SearchLocationForAddPageRoute _fromState(GoRouterState state) =>
      SearchLocationForAddPageRoute(
        publicListId: state.params['publicListId']!,
        searchPhrase: state.queryParams['search-phrase'],
        listItemId: state.queryParams['list-item-id'],
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/items/add/searchlocation',
        queryParams: {
          if (searchPhrase != null) 'search-phrase': searchPhrase!,
          if (listItemId != null) 'list-item-id': listItemId!,
        },
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $ListItemDetailsPageRouteExtension on ListItemDetailsPageRoute {
  static ListItemDetailsPageRoute _fromState(GoRouterState state) =>
      ListItemDetailsPageRoute(
        publicListId: state.params['publicListId']!,
        listItemId: state.queryParams['list-item-id'],
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/items/${Uri.encodeComponent(listItemId!)}/details',
        queryParams: {
          if (listItemId != null) 'list-item-id': listItemId!,
        },
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $FilterPageRouteExtension on FilterPageRoute {
  static FilterPageRoute _fromState(GoRouterState state) => FilterPageRoute(
        publicListId: state.params['publicListId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/items/filter',
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
