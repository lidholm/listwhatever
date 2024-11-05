import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:listwhatever/standard/helpers/logger_helper.dart';
import '/standard/emulator/emulator_info.dart';
import '/standard/emulator/get_emulator_info.dart';

const port = 9099;

Future<firebase_auth.FirebaseAuth> getFirebaseAuth() async {
  final emulatorInfo = await getEmulatorInfo();

  final instance = firebase_auth.FirebaseAuth.instance;
  if (emulatorInfo.type != EmulatorType.none) {
    // LoggerHelper.logger.d('firestoreProvider. Using emulator ${emulatorInfo.address}');
    LoggerHelper.logger
        .d('firestoreProvider. Using emulator ${emulatorInfo.address}');
    await instance.useAuthEmulator(emulatorInfo.address!, port);
    // await instance.clearPersistence();
  } else {
    LoggerHelper.logger.d('firestoreProvider.using firestore without emulator');
  }

  return instance;
}
