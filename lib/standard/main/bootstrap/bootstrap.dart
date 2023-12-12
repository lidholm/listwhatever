import 'dart:async';

import 'package:analytics_repository/analytics_repository.dart';
import 'package:authentication_client/authentication_client.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_authentication_client/firebase_authentication_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:listanything/standard/firebase/firebase_options.dart';
import 'package:listanything/standard/firebase/firestore/firebase_auth.dart';
import 'package:listanything/standard/main/bootstrap/app_bloc_observer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_storage/persistent_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:token_storage/token_storage.dart';
import 'package:user_repository/user_repository.dart';

typedef AppBuilder = Future<Widget> Function(
  FirebaseMessaging firebaseMessaging,
  SharedPreferences sharedPreferences,
  AnalyticsRepository analyticsRepository,
  AuthenticationClient authenticationClient,
  UserStorage userStorage,
);

Future<void> bootstrap(AppBuilder builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final analyticsRepository = AnalyticsRepository(FirebaseAnalytics.instance);
  final blocObserver = AppBlocObserver(
    analyticsRepository: analyticsRepository,
  );
  Bloc.observer = blocObserver;
  if (!kIsWeb) {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationSupportDirectory(),
    );
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  final sharedPreferences = await SharedPreferences.getInstance();

  final tokenStorage = InMemoryTokenStorage();

  final persistentStorage = PersistentStorage(
    sharedPreferences: sharedPreferences,
  );

  final userStorage = UserStorage(storage: persistentStorage);

  final authenticationClient = FirebaseAuthenticationClient(
    tokenStorage: tokenStorage,
    firebaseAuth: await getFirebaseAuth(),
  );

  runApp(
    await builder(
      FirebaseMessaging.instance,
      sharedPreferences,
      analyticsRepository,
      authenticationClient,
      userStorage,
    ),
  );
}
