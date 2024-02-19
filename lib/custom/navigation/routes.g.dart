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
          path: 'logs',
          name: 'logs',
          factory: $OnScreenLogsPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'lists',
          name: 'lists',
          factory: $ListsPageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'subscribe/:code',
              name: 'subscribe',
              factory: $SubscribeListPageRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: ':listId/items',
              name: 'items',
              factory: $ListItemsPageRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'add',
                  name: 'addListItem',
                  factory: $AddListItemPageRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: ':itemId/edit',
                  name: 'editListItem',
                  factory: $EditListItemPageRouteExtension._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'add',
              name: 'addList',
              factory: $AddListPageRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: ':listId/edit',
              name: 'editList',
              factory: $EditListPageRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: ':listId/share',
              name: 'share',
              factory: $ShareListPageRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: ':listId/import/csv',
              name: 'importcsv',
              factory: $ImportCsvPageRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: ':listId/import/spreadsheet',
              name: 'listasspreadsheet',
              factory: $ListAsSpreadsheetsPageRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'search_location',
          name: 'search_location',
          factory: $SearchLocationPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'user_profile',
          name: 'user_profile',
          factory: $UserProfilePageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'login',
          name: 'login',
          factory: $LoginPageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'email',
              name: 'login_email',
              factory: $LoginWithEmailAndPasswordPageRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'remoteconfig',
          name: 'remoteconfig',
          factory: $RemoteConfigPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'about',
          name: 'about',
          factory: $AboutPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'crashlytics',
          name: 'crashlytics',
          factory: $CrashlyticstPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'deleteaccount',
          name: 'deleteaccount',
          factory: $DeleteAccountPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'firebaseperformance',
          name: 'firebaseperformance',
          factory: $FirebasePerformancePageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'firebaseinappmessaging',
          name: 'firebaseinappmessaging',
          factory: $FirebaseInAppMessagingPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'privacypolicy',
          name: 'privacypolicy',
          factory: $PrivacyPolicyPageRouteExtension._fromState,
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

extension $OnScreenLogsPageRouteExtension on OnScreenLogsPageRoute {
  static OnScreenLogsPageRoute _fromState(GoRouterState state) =>
      const OnScreenLogsPageRoute();

  String get location => GoRouteData.$location(
        '/logs',
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

extension $SubscribeListPageRouteExtension on SubscribeListPageRoute {
  static SubscribeListPageRoute _fromState(GoRouterState state) =>
      SubscribeListPageRoute(
        state.pathParameters['code']!,
      );

  String get location => GoRouteData.$location(
        '/lists/subscribe/${Uri.encodeComponent(code)}',
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
        listId: state.pathParameters['listId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(listId)}/items',
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
        state.pathParameters['listId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(listId)}/items/add',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EditListItemPageRouteExtension on EditListItemPageRoute {
  static EditListItemPageRoute _fromState(GoRouterState state) =>
      EditListItemPageRoute(
        state.pathParameters['listId']!,
        state.pathParameters['itemId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(listId)}/items/${Uri.encodeComponent(itemId)}/edit',
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

extension $EditListPageRouteExtension on EditListPageRoute {
  static EditListPageRoute _fromState(GoRouterState state) => EditListPageRoute(
        state.pathParameters['listId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(listId)}/edit',
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
        state.pathParameters['listId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(listId)}/share',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ImportCsvPageRouteExtension on ImportCsvPageRoute {
  static ImportCsvPageRoute _fromState(GoRouterState state) =>
      ImportCsvPageRoute(
        state.pathParameters['listId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(listId)}/import/csv',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ListAsSpreadsheetsPageRouteExtension on ListAsSpreadsheetsPageRoute {
  static ListAsSpreadsheetsPageRoute _fromState(GoRouterState state) =>
      ListAsSpreadsheetsPageRoute(
        state.pathParameters['listId']!,
      );

  String get location => GoRouteData.$location(
        '/lists/${Uri.encodeComponent(listId)}/import/spreadsheet',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SearchLocationPageRouteExtension on SearchLocationPageRoute {
  static SearchLocationPageRoute _fromState(GoRouterState state) =>
      const SearchLocationPageRoute();

  String get location => GoRouteData.$location(
        '/search_location',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $UserProfilePageRouteExtension on UserProfilePageRoute {
  static UserProfilePageRoute _fromState(GoRouterState state) =>
      const UserProfilePageRoute();

  String get location => GoRouteData.$location(
        '/user_profile',
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

extension $LoginWithEmailAndPasswordPageRouteExtension
    on LoginWithEmailAndPasswordPageRoute {
  static LoginWithEmailAndPasswordPageRoute _fromState(GoRouterState state) =>
      const LoginWithEmailAndPasswordPageRoute();

  String get location => GoRouteData.$location(
        '/login/email',
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
        '/remoteconfig',
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

extension $FirebasePerformancePageRouteExtension
    on FirebasePerformancePageRoute {
  static FirebasePerformancePageRoute _fromState(GoRouterState state) =>
      const FirebasePerformancePageRoute();

  String get location => GoRouteData.$location(
        '/firebaseperformance',
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
        '/firebaseinappmessaging',
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
