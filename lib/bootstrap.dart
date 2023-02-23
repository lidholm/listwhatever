import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firebase_options.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

// Requires that the Firebase Auth emulator is running locally
// e.g via `melos run firebase:emulator`.
  WidgetsFlutterBinding.ensureInitialized();
  // We're using the manual installation on non-web platforms since Google sign
  // in plugin doesn't yet support Dart initialization.
  // See related issue: https://github.com/flutter/flutter/issues/96391

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    // emailLinkProviderConfig,
    PhoneAuthProvider(),
    GoogleProvider(clientId: 'GOOGLE_CLIENT_ID'),
    // AppleProvider(),
  ]);

  runApp(
    ProviderScope(
      child: await builder(),
    ),
  );
  // await runZonedGuarded(
  // () async {

  // (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  // );
}
