import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocationCubit extends Cubit<Position?> {
  CurrentLocationCubit() : super(null) {
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
