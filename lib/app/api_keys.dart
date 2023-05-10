import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:listanything/app/widgets/standardWidgets/custom_exception.dart';

String getMapsApiKey() {
  if (kIsWeb) return 'AIzaSyBBtYRdN5aGIKlv8YSFD6HsWD2CkoNRFik';
  if (Platform.isAndroid) return 'AIzaSyDCKm_5WrpJBbre-270rz9krFtim_1X4TE';
  if (Platform.isIOS) return 'AIzaSyA20FdKTcLsO-NHGlBaVBtix4IYSbfYLyM';
  throw const CustomException(message: 'Platform is not supported yet');
}
