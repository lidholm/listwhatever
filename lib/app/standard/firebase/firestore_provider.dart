import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/standard/firebase/use_firebase_emulator_provider.dart';
import '/app/standard/helpers/constants.dart';

const port = 8080;
final Provider<FirebaseFirestore> baseFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final firestoreProvider = FutureProvider<FirebaseFirestore>((ref) async {
  final useFirebaseEmulator = await ref.watch(useFirebaseEmulatorProvider.future);
  final localHostString = await ref.watch(emulatorIpAddressProvider.future);

  final instance = ref.watch(baseFirestoreProvider);

  logger.d('firestoreProvider.instance: $instance');

  if (useFirebaseEmulator) {
    logger.d('firestoreProvider. Using emulator $localHostString');
    _connectToFirebaseEmulator(instance, localHostString);
    // await instance.clearPersistence();
  } else {
    logger.d('firestoreProvider.using firestore without emulator');
  }

  return instance;
});

void _connectToFirebaseEmulator(
  FirebaseFirestore instance,
  String localHostString,
) {
  logger.d('Using $localHostString for Firestore');
  instance.useFirestoreEmulator(
    localHostString,
    port,
  );
}
