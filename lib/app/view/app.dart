import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterbase/app/view/auth.dart';
import 'package:flutterbase/app/view/auth_page.dart';
import 'package:flutterbase/app/view/current_user_provider.dart';
import 'package:flutterbase/app/view/loading_user_page.dart';
import 'package:flutterbase/app/view/profile_page.dart';
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
    ],
    redirect: (context, state) {
      // and then use userChanges to check for changes to if a user is logged in or not
      final userChanges = ref.watch(userChangesProvider);
      final currentUser = FirebaseAuth.instance.currentUser;

      print('currentUser: ${currentUser?.email}');
      print('userChanges: ${userChanges.asData?.value?.email}');

      if (currentUser != null) {
        print('going to: /profile');
        return '/profile';
      }
      final path = userChanges.when(
        error: (e, st) => '/error_loading_user',
        loading: () => '/loading_user',
        data: (user) => user == null ? '/authgate' : '/profile',
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
