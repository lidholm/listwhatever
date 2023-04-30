import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/navigation/current_user_provider.dart';
import 'package:listanything/app/navigation/routes/list_page_route.dart';
import 'package:listanything/app/navigation/routes/loading_user_route.dart';
import 'package:listanything/app/navigation/routes/routes.dart';
import 'package:listanything/app/navigation/routes/sign_in_screen_route.dart';

final providers = [EmailAuthProvider()];
// GoRouter configuration
final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: ListsPageRoute().location,
    //debugLogDiagnostics: true,
    routes: $appRoutes,
    redirect: (context, state) {
      //print('state.fullpath: ${state.fullpath}');
      // and then use userChanges to check for changes to if a user is logged in or not
      final userChanges = ref.watch(userChangesProvider);

      //print('userChanges: ${userChanges.asData?.value?.email} - ${userChanges.asData?.value?.uid}');

      final path = userChanges.when(
        error: (e, st) => '/error_loading_user',
        loading: () => const LoadingUserRoute().location,
        data: (user) {
          //print('router: user: $user');
          return user == null ? const SignInScreenRoute().location : null;
        },
      );
      //print('going to. $path');
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
      theme: ThemeData(
        splashColor: Colors.orange[800],
        // Define the default brightness and colors.
        // brightness: Brightness.dark,
        primaryColor: Colors.orange[800],
        appBarTheme: AppBarTheme(
          color: Colors.orange[800],
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          floatingLabelStyle:
              const TextStyle(color: Colors.black, fontSize: 16),
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange[800]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange[800]!,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange[800]!,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          errorStyle: const TextStyle(height: 0.7),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
          fillColor: MaterialStateProperty.all(Colors.orange),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.orange[800],
            minimumSize: const Size(88, 36),
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black87,
            minimumSize: const Size(88, 36),
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
        // Define the default font family.
        // fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        // textTheme: const TextTheme(
        //   displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
        //   titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
        //   bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
        // ),
      ),
    );
  }
}
