import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterbase/app/view/auth.dart';
import 'package:flutterbase/app/view/auth_page.dart';
import 'package:flutterbase/app/view/current_user_provider.dart';
import 'package:flutterbase/app/view/loading_user_page.dart';
import 'package:flutterbase/app/view/profile_page.dart';
import 'package:flutterbase/counter/counter.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final routerProvider = Provider(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: '/loading_user',
        builder: (context, state) => const LoadingUserPage(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/authgate',
        builder: (context, state) => const AuthGate(),
      ),
      GoRoute(
        path: '/counter',
        builder: (context, state) => const CounterPage(),
      ),
    ],
    redirect: (context, state) {
      // and then use userChanges to check for changes to if a user is logged in or not
      final userChanges = ref.watch(userChangesProvider);

      print('userChanges: ${userChanges.asData?.value?.email}');

      final path = userChanges.when(
        error: (e, st) => '/error_loading_user',
        loading: () => '/loading_user',
        data: (user) => user == null ? '/authgate' : null,
      );
      print('going to. $path');
      return path;
    },
  ),
);

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
