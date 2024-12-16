import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listwhatever/emulator/emulator_info.dart';
import 'package:listwhatever/emulator/get_emulator_info.dart';

const port = 8080;

Future<FirebaseFirestore> getFirestore() async {
  final emulatorInfo = await getEmulatorInfo();

  final instance = FirebaseFirestore.instance;
  if (emulatorInfo.type != EmulatorType.none) {
    //
    _connectToFirebaseEmulator(instance, emulatorInfo.address!);
    // await instance.clearPersistence();
  } else {
    //
  }

  return instance;
}

void _connectToFirebaseEmulator(
  FirebaseFirestore instance,
  String localHostString,
) {
  instance.useFirestoreEmulator(
    localHostString,
    port,
  );
}
