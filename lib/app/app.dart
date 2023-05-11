import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/common_theme_data.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/navigation/current_user_provider.dart';
import 'package:listanything/app/navigation/routes/about_page_route.dart';
import 'package:listanything/app/navigation/routes/error_loading_user_route.dart';
import 'package:listanything/app/navigation/routes/list_page_route.dart';
import 'package:listanything/app/navigation/routes/loading_user_route.dart';
import 'package:listanything/app/navigation/routes/privacy_policy_page_route.dart';
import 'package:listanything/app/navigation/routes/routes.dart';
import 'package:listanything/app/navigation/routes/sign_in_screen_route.dart';
import 'package:listanything/app/navigation/routes/sign_up_user_page_route.dart';
import 'package:listanything/l10n/l10n.dart';

final providers = [EmailAuthProvider()];

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: ListsPageRoute().location,
    //debugLogDiagnostics: true,
    routes: $appRoutes,
    navigatorKey: navKey,
    redirect: (context, state) async {
      logger.d('state.fullpath: ${state.fullpath}');
      // and then use userChanges to check for changes to if a user is logged in or not

      final dontRequireLogin = [
        const PrivacyPolicyPageRoute().location,
        const AboutPageRoute().location
      ];

      if (dontRequireLogin.contains(state.location)) {
        return null;
      }

      logger
        ..d('state.location: ${state.location}')
        ..d('WelcomeRoute().location: ${WelcomeRoute().location}')
        ..d('equals: ${state.location == WelcomeRoute().location}');

      if (state.location == WelcomeRoute().location) {
        return ListsPageRoute().location;
      }

      final userChanges = ref.watch(currentUserProvider);
      final path = userChanges.when(
        error: (e, st) {
          if (e is FirebaseException && e.code == 'permission-denied') {
            return const SignUpUserPageRoute().location;
          }
          logger
            ..e(e)
            ..e(st);
          return const ErrorLoadingUserRoute().location;
        },
        loading: () => const LoadingUserRoute().location,
        data: (user) {
          logger.d('router: user: $user');
          return user == null ? const SignInScreenRoute().location : null;
        },
      );
      logger.d('going to. $path');
      return path;
    },
  ),
);

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      theme: commonThemeData,
    );
  }
}
