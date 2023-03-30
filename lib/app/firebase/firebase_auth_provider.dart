import 'package:firebase_auth/firebase_auth.dart' as fire_auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/use_firebase_emulator_provider.dart';

final Provider<fire_auth.FirebaseAuth> baseFirebaseAuthProvider = Provider<fire_auth.FirebaseAuth>((ref) {
  return fire_auth.FirebaseAuth.instance;
});

final firebaseAuthProvider = FutureProvider<fire_auth.FirebaseAuth>((ref) async {
  final useFirebaseEmulator = await ref.watch(useFirebaseEmulatorProvider.future);
  final instance = ref.watch(baseFirebaseAuthProvider);

  if (useFirebaseEmulator) {
    final localHostString = await ref.watch(emulatorIpAddressProvider.future);
    const port = 9099;
    // ignore: avoid_print
    print('firebaseAuthProvider.using auth with emulator at ip $localHostString and port $port');
    await instance.useAuthEmulator(localHostString, port);
  } else {
    // ignore: avoid_print
    print('firebaseAuthProvider.using auth without emulator');
  }
  return instance;
});
