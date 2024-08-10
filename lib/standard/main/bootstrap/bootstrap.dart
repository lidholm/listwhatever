import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/standard/analyticsRepository/analytics_repository.dart';
import '/standard/app/view/app.dart';
import '/standard/authenticationClient/firebase_authentication_client.dart';
import '/standard/authenticationClient/token_storage.dart';
import '/standard/firebase/firebase_options.dart';
import '/standard/firebase/firestore/firebase_auth.dart';
import '/standard/main/bootstrap/app_bloc_observer.dart';
import '/standard/storage/persistentStorage/persistent_storage.dart';
import '/standard/userRepository/user_repository.dart';
import '/standard/userRepository/user_storage.dart';

Future<void> bootstrap() async {
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
    googleSignIn: GoogleSignIn(),
  );

  final userRepository = UserRepository(
    authenticationClient: authenticationClient,
    storage: userStorage,
  );

  runApp(
    App(
      userRepository: userRepository,
      analyticsRepository: analyticsRepository,
      user: await userRepository.user.first,
    ),
  );
}
