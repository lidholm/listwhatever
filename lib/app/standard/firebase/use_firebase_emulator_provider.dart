import 'dart:io';

import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/standard/firebase/device_info_provider.dart';
import '/app/standard/helpers/constants.dart';

bool? override;

final useFirebaseEmulatorProvider = FutureProvider<bool>((ref) async {
  final deviceInfo = await ref.watch(deviceInfoProvider.future);
  logger
    ..d('isPhysicalDevice: ${deviceInfo['isPhysicalDevice']}')
    ..d('foundation.kDebugMode: ${foundation.kDebugMode}');
  final useEmulator = deviceInfo['isPhysicalDevice'] == false || foundation.kDebugMode;
  if (override != null) {
    logger.d('useEmaulator: $override');
    return override!;
  }
  logger.d('useEmulator: $useEmulator');
  return useEmulator;
});

final emulatorIpAddressProvider = FutureProvider<String>((ref) async {
  final deviceInfo = await ref.watch(deviceInfoProvider.future);
  if (kIsWeb) return 'localhost';

  final localHostString = deviceInfo['isPhysicalDevice'] == true
      ? '192.168.86.66'
      : Platform.isAndroid
          ? '10.0.2.2'
          : 'localhost';
  return localHostString;
});
