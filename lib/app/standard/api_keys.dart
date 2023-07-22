import 'dart:io';

import 'package:flutter/foundation.dart';
import '/app/standard/widgets/custom_exception.dart';

String getMapsApiKey() {
  // TODO: Use --dart-define
  if (kIsWeb) return '<GOOGLE_MAPS_API_WEB>';
  if (Platform.isAndroid) return '<GOOGLE_MAPS_API_ANDROID>';
  if (Platform.isIOS) return '<GOOGLE_MAPS_API_IOS>';
  throw const CustomException(message: 'Platform is not supported yet');
}

String getGoogleClientId() {
  return '<GOOGLE_CLIENT_ID>';
}
