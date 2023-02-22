import 'dart:async';
import 'dart:developer';
import 'dart:math' hide log;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterbase/firebase_options.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final shouldUseFirebaseEmulator = Random().nextInt(10) > -1;

// Requires that the Firebase Auth emulator is running locally
// e.g via `melos run firebase:emulator`.
  WidgetsFlutterBinding.ensureInitialized();
  // We're using the manual installation on non-web platforms since Google sign
  // in plugin doesn't yet support Dart initialization.
  // See related issue: https://github.com/flutter/flutter/issues/96391

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (shouldUseFirebaseEmulator) {
    const localHostString =
        //  false
        //?
        '192.168.86.23'
        // : Platform.isAndroid
        //     ? '10.0.2.2' :
        // 'localhost'
        ;

    print('use emulator to $localHostString');
    await FirebaseAuth.instance.useAuthEmulator(localHostString, 9099);
  } else {
    print('not using emulator');
  }

  FirebaseAuth.instance.authStateChanges().distinct((first, _) => first?.uid == null).listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
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
