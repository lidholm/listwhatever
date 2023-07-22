import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/standard/firebase/use_firebase_emulator_provider.dart';
import '/app/standard/helpers/constants.dart';

final Provider<FirebaseAuth> baseFirebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final firebaseAuthProvider = FutureProvider<FirebaseAuth>((ref) async {
  final useFirebaseEmulator = await ref.watch(useFirebaseEmulatorProvider.future);
  final instance = ref.watch(baseFirebaseAuthProvider);

  if (useFirebaseEmulator) {
    final localHostString = await ref.watch(emulatorIpAddressProvider.future);
    const port = 9099;
    // ignore: avoid_print
    logger.d(
      'firebaseAuthProvider.using auth with emulator at ip $localHostString and port $port',
    );
    await instance.useAuthEmulator(localHostString, port);
  } else {
    // ignore: avoid_print
    logger.d('firebaseAuthProvider.using auth without emulator');
  }
  return instance;
});
