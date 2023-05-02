import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

final locationProvider =
    FutureProvider((ref) => Location.instance.getLocation());
