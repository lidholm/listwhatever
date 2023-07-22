import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/custom/geocoder/geocoderresult.dart';

final selectedAddressProvider = StateProvider<GeocoderResult?>((ref) => null);
