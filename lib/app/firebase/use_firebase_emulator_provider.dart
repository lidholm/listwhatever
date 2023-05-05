import 'dart:io';

import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/device_info_provider.dart';

bool? override;

final useFirebaseEmulatorProvider = FutureProvider<bool>((ref) async {
  final deviceInfo = await ref.watch(deviceInfoProvider.future);
  //print('isPhysicalDevice: ${deviceInfo['isPhysicalDevice']}');
  //print('foundation.kDebugMode: ${foundation.kDebugMode}');
  final useEmulator =
      deviceInfo['isPhysicalDevice'] == false || foundation.kDebugMode;
  if (override != null) {
    //print('useEmaulator: $override');
    return override!;
  }
  // ignore: avoid_print
  //print('useEmulator: $useEmulator');
  return useEmulator;
});

final emulatorIpAddressProvider = FutureProvider<String>((ref) async {
  final deviceInfo = await ref.watch(deviceInfoProvider.future);
  if (kIsWeb) return 'localhost';

  final localHostString = deviceInfo['isPhysicalDevice'] == true
      ? '192.168.86.60'
      : Platform.isAndroid
          ? '10.0.2.2'
          : 'localhost';
  return localHostString;
});
