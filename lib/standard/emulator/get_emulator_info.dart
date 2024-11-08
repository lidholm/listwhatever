import 'dart:io';

import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/foundation.dart';
import '/standard/emulator/device_info.dart';

import 'emulator_info.dart';

// override == null    =>   use whatever the rest of the code decides
// override == false   =>   don't use emulator
// override == true    =>   use emulator

bool? override;

Future<EmulatorInfo> getEmulatorInfo() async {
  final deviceInfo = await getDeviceInfo();
  // logger
  //   ..d('isPhysicalDevice: ${deviceInfo['isPhysicalDevice']}')
  //   ..d('foundation.kDebugMode: ${foundation.kDebugMode}');
  final useEmulator =
      deviceInfo['isPhysicalDevice'] == false || foundation.kDebugMode;
  // logger
  //   ..d('useEmulator: $useEmulator')
  //   ..d('override: $override');
  if (useEmulator == false || override == false) {
    return EmulatorInfo(type: EmulatorType.none, address: null);
  }
  //

  if (kIsWeb) {
    return EmulatorInfo(type: EmulatorType.localhost, address: 'localhost');
  }

  if (deviceInfo['isPhysicalDevice'] == true) {
    return EmulatorInfo(type: EmulatorType.ip, address: '192.168.86.66');
  }
  if (Platform.isAndroid) {
    return EmulatorInfo(type: EmulatorType.ip, address: '10.0.2.2');
  }
  return EmulatorInfo(type: EmulatorType.localhost, address: 'localhost');
}
