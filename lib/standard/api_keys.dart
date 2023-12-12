
import 'dart:io';
import 'package:flutter/foundation.dart';

String getMapsApiKey() {
  // TODO: Use --dart-define
  if (kIsWeb) return 'AIzaSyBBtYRdN5aGIKlv8YSFD6HsWD2CkoNRFik';
  if (Platform.isAndroid) return '<GOOGLE_MAPS_API_ANDROID>';
  if (Platform.isIOS) return '<GOOGLE_MAPS_API_IOS>';
  throw  Exception( 'Platform is not supported yet');
}
String getGoogleClientId() {
  return '<GOOGLE_CLIENT_ID>';
}
