import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:listwhatever/app/view/app.dart';
import 'package:listwhatever/bootstrap.dart';
import 'package:listwhatever/firebase_options.dart';

const bool shouldUseEmulator = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  if (shouldUseEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }

  if (shouldUseEmulator) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }

  await bootstrap(
    (
      authRepository,
      userListRepository,
      listRepository,
      listItemRepository,
    ) =>
        App(
      key: const Key('appkey'),
      authRepository: authRepository,
      userListRepository: userListRepository,
      listRepository: listRepository,
      listItemRepository: listItemRepository,
    ),
  );
}
