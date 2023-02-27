import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/geocoder/geocoderresult.dart';

final selectedAddressProvider = StateProvider<GeocoderResult?>((ref) => null);
