import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:allmylists/standard/analyticsRepository/analytics_repository.dart';
import 'package:allmylists/standard/authenticationClient/authentication_client.dart';
import 'package:allmylists/standard/authenticationClient/firebase_authentication_client.dart';
import 'package:allmylists/standard/authenticationClient/token_storage.dart';
import 'package:allmylists/standard/firebase/firebase_options.dart';
import 'package:allmylists/standard/firebase/firestore/firebase_auth.dart';
import 'package:allmylists/standard/main/bootstrap/app_bloc_observer.dart';
import 'package:allmylists/standard/storage/persistentStorage/persistent_storage.dart';
import 'package:allmylists/standard/userRepository/user_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
