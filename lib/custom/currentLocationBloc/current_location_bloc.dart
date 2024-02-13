import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

class LocationCubit extends Cubit<Position> {
  LocationCubit()
      : super(
          Position(
            latitude: 0,
            longitude: 0,
            timestamp: DateTime.now(),
            accuracy: 0,
            altitude: 0,
            heading: 0,
            speed: 0,
            speedAccuracy: 0,
            altitudeAccuracy: 0,
            headingAccuracy: 0,
          ),
        ) {
    _startLocationUpdates();
  }

  StreamSubscription<void>? _locationSubscription;

  void _startLocationUpdates() {
    _locationSubscription = Stream<void>.periodic(const Duration(seconds: 5)).listen((_) {
      _getCurrentLocation();
    });
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print('position: $position');
      emit(position);
    } catch (e) {
      // handle exception
    }
  }

  @override
  Future<void> close() {
    _locationSubscription?.cancel();
    return super.close();
  }
}
