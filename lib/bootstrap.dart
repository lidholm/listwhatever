import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/app/standard/firebase/firebase_options.dart';
import '/app/standard/widgets/error_monitor.dart';
import 'app/standard/api_keys.dart';

final repaintBoundaryKey = GlobalKey();

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  if (!kIsWeb) {
    FlutterError.onError = (details) {
      log(details.exceptionAsString(), stackTrace: details.stack);
    };
  }

// Requires that the Firebase Auth emulator is running locally
// e.g via `melos run firebase:emulator`.
  WidgetsFlutterBinding.ensureInitialized();
  // We're using the manual installation on non-web platforms since Google sign
  // in plugin doesn't yet support Dart initialization.
  // See related issue: https://github.com/flutter/flutter/issues/96391

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError = (errorDetails) {
    // If you wish to record a "non-fatal" exception, please use `FirebaseCrashlytics.instance.recordFlutterError` instead
    if (kIsWeb) {
      ErrorMonitor.web().recordFlutterFatalError(errorDetails);
    } else {
      ErrorMonitor.device().recordFlutterFatalError(errorDetails);
    }
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    // If you wish to record a "non-fatal" exception, please remove the "fatal" parameter
    if (kIsWeb) {
      ErrorMonitor.web().recordError(error, stack, '');
    } else {
      ErrorMonitor.device().recordError(error, stack, '');
    }
    return true;
  };

  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    // emailLinkProviderConfig,
    PhoneAuthProvider(),
    GoogleProvider(clientId: getGoogleClientId()),
    // AppleProvider(),
  ]);

  runApp(
    ProviderScope(
      child: RepaintBoundary(key: repaintBoundaryKey, child: await builder()),
    ),
  );
  // await runZonedGuarded(
  // () async {

  // (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  // );
}
