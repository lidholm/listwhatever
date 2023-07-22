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
          path: 'deleteaccount',
          factory: $DeleteAccountPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'loading_user',
          factory: $LoadingUserRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'sign_in',
          factory: $SignInPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'errorloadinguser',
          factory: $ErrorLoadingUserRouteExtension._fromState,
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
        GoRouteData.$route(
          path: 'crashlytics',
          factory: $CrashlyticstPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'remote_config',
          factory: $RemoteConfigPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'analytics',
          factory: $AnalyticsPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'performance',
          factory: $PerformancePageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'inappmessaging',
          factory: $FirebaseInAppMessagingPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'lists',
          factory: $ListsPageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'signup',
              factory: $SignUpUserPageRouteExtension._fromState,
            ),
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

extension $DeleteAccountPageRouteExtension on DeleteAccountPageRoute {
  static DeleteAccountPageRoute _fromState(GoRouterState state) =>
      const DeleteAccountPageRoute();

  String get location => GoRouteData.$location(
        '/deleteaccount',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoadingUserRouteExtension on LoadingUserRoute {
  static LoadingUserRoute _fromState(GoRouterState state) =>
      const LoadingUserRoute();

  String get location => GoRouteData.$location(
        '/loading_user',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SignInPageRouteExtension on SignInPageRoute {
  static SignInPageRoute _fromState(GoRouterState state) =>
      const SignInPageRoute();

  String get location => GoRouteData.$location(
        '/sign_in',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ErrorLoadingUserRouteExtension on ErrorLoadingUserRoute {
  static ErrorLoadingUserRoute _fromState(GoRouterState state) =>
      const ErrorLoadingUserRoute();

  String get location => GoRouteData.$location(
        '/errorloadinguser',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfilePageRouteExtension on ProfilePageRoute {
  static ProfilePageRoute _fromState(GoRouterState state) =>
      const ProfilePageRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AboutPageRouteExtension on AboutPageRoute {
  static AboutPageRoute _fromState(GoRouterState state) =>
      const AboutPageRoute();

  String get location => GoRouteData.$location(
        '/about',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PrivacyPolicyPageRouteExtension on PrivacyPolicyPageRoute {
  static PrivacyPolicyPageRoute _fromState(GoRouterState state) =>
      const PrivacyPolicyPageRoute();

  String get location => GoRouteData.$location(
        '/privacypolicy',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CrashlyticstPageRouteExtension on CrashlyticstPageRoute {
  static CrashlyticstPageRoute _fromState(GoRouterState state) =>
      const CrashlyticstPageRoute();

  String get location => GoRouteData.$location(
        '/crashlytics',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RemoteConfigPageRouteExtension on RemoteConfigPageRoute {
  static RemoteConfigPageRoute _fromState(GoRouterState state) =>
      const RemoteConfigPageRoute();

  String get location => GoRouteData.$location(
        '/remote_config',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AnalyticsPageRouteExtension on AnalyticsPageRoute {
  static AnalyticsPageRoute _fromState(GoRouterState state) =>
      const AnalyticsPageRoute();

  String get location => GoRouteData.$location(
        '/analytics',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PerformancePageRouteExtension on PerformancePageRoute {
  static PerformancePageRoute _fromState(GoRouterState state) =>
      const PerformancePageRoute();

  String get location => GoRouteData.$location(
        '/performance',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FirebaseInAppMessagingPageRouteExtension
    on FirebaseInAppMessagingPageRoute {
  static FirebaseInAppMessagingPageRoute _fromState(GoRouterState state) =>
      const FirebaseInAppMessagingPageRoute();

  String get location => GoRouteData.$location(
        '/inappmessaging',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ListsPageRouteExtension on ListsPageRoute {
  static ListsPageRoute _fromState(GoRouterState state) => ListsPageRoute();

  String get location => GoRouteData.$location(
        '/lists',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SignUpUserPageRouteExtension on SignUpUserPageRoute {
  static SignUpUserPageRoute _fromState(GoRouterState state) =>
      const SignUpUserPageRoute();

  String get location => GoRouteData.$location(
        '/lists/signup',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ShareListPageRouteExtension on ShareListPageRoute {
  static ShareListPageRoute _fromState(GoRouterState state) =>
      ShareListPageRoute(
        publicListId: state.pathParameters['publicListId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/share',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ShareCodePageRouteExtension on ShareCodePageRoute {
  static ShareCodePageRoute _fromState(GoRouterState state) =>
      ShareCodePageRoute(
        publicListId: state.pathParameters['publicListId']!,
        shareCode: state.pathParameters['shareCode']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/shareCode/${Uri.encodeComponent(shareCode)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddListRouteExtension on AddListRoute {
  static AddListRoute _fromState(GoRouterState state) => const AddListRoute();

  String get location => GoRouteData.$location(
        '/lists/add',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EditListRouteExtension on EditListRoute {
  static EditListRoute _fromState(GoRouterState state) => EditListRoute(
        publicListId: state.pathParameters['publicListId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/edit',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ListItemsPageRouteExtension on ListItemsPageRoute {
  static ListItemsPageRoute _fromState(GoRouterState state) =>
      ListItemsPageRoute(
        publicListId: state.pathParameters['publicListId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/items',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EditListItemRouteExtension on EditListItemRoute {
  static EditListItemRoute _fromState(GoRouterState state) => EditListItemRoute(
        publicListId: state.pathParameters['publicListId']!,
        listItemId: state.pathParameters['listItemId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/items/${Uri.encodeComponent(listItemId)}/edit',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SearchLocationForEditPageRouteExtension
    on SearchLocationForEditPageRoute {
  static SearchLocationForEditPageRoute _fromState(GoRouterState state) =>
      SearchLocationForEditPageRoute(
        publicListId: state.pathParameters['publicListId']!,
        listItemId: state.pathParameters['listItemId']!,
        searchPhrase: state.queryParameters['search-phrase'],
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/items/${Uri.encodeComponent(listItemId)}/edit/searchlocation',
        queryParams: {
          if (searchPhrase != null) 'search-phrase': searchPhrase,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddListItemRouteExtension on AddListItemRoute {
  static AddListItemRoute _fromState(GoRouterState state) => AddListItemRoute(
        publicListId: state.pathParameters['publicListId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/items/add',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SearchLocationForAddPageRouteExtension
    on SearchLocationForAddPageRoute {
  static SearchLocationForAddPageRoute _fromState(GoRouterState state) =>
      SearchLocationForAddPageRoute(
        publicListId: state.pathParameters['publicListId']!,
        listItemId: state.queryParameters['list-item-id'],
        searchPhrase: state.queryParameters['search-phrase'],
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/items/add/searchlocation',
        queryParams: {
          if (listItemId != null) 'list-item-id': listItemId,
          if (searchPhrase != null) 'search-phrase': searchPhrase,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ListItemDetailsPageRouteExtension on ListItemDetailsPageRoute {
  static ListItemDetailsPageRoute _fromState(GoRouterState state) =>
      ListItemDetailsPageRoute(
        publicListId: state.pathParameters['publicListId']!,
        listItemId: state.pathParameters['listItemId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/items/${Uri.encodeComponent(listItemId)}/details',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FilterPageRouteExtension on FilterPageRoute {
  static FilterPageRoute _fromState(GoRouterState state) => FilterPageRoute(
        publicListId: state.pathParameters['publicListId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(publicListId)}/items/filter',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
