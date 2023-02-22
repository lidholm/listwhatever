import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterbase/app/navigation/current_user_provider.dart';
import 'package:flutterbase/app/navigation/routes.dart';
import 'package:go_router/go_router.dart';

final providers = [EmailAuthProvider()];
// GoRouter configuration
final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: HomeScreenRoute().location,
    routes: $appRoutes,
    redirect: (context, state) {
      // and then use userChanges to check for changes to if a user is logged in or not
      final userChanges = ref.watch(userChangesProvider);

      print('userChanges: ${userChanges.asData?.value?.email}');

      final path = userChanges.when(
        error: (e, st) => '/error_loading_user',
        loading: () => const LoadingUserRoute().location,
        data: (user) => user == null ? const SignInScreenRoute().location : null,
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
