import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/use_firebase_emulator_provider.dart';

const port = 8080;
final Provider<FirebaseFirestore> baseFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final firestoreProvider = FutureProvider<FirebaseFirestore>((ref) async {
  final useFirebaseEmulator = await ref.watch(useFirebaseEmulatorProvider.future);
  final localHostString = await ref.watch(emulatorIpAddressProvider.future);

  final instance = ref.watch(baseFirestoreProvider);

  // ignore: avoid_print
  print('firestoreProvider.instance: $instance');

  if (useFirebaseEmulator) {
    // ignore: avoid_print
    print('firestoreProvider. Using emulator $localHostString');
    _connectToFirebaseEmulator(instance, localHostString);
  } else {
    // ignore: avoid_print
    print('firestoreProvider.using firestore without emulator');
  }

  return instance;
});

void _connectToFirebaseEmulator(FirebaseFirestore instance, String localHostString) {
  // ignore: avoid_print
  print('Using $localHostString for Firestore');
  instance.useFirestoreEmulator(
    localHostString,
    port,
  );
}
