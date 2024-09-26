part of 'firebase_storage_bloc.dart';

@freezed
class FirebaseStorageEvent with _$FirebaseStorageEvent {
  const factory FirebaseStorageEvent.loadFile(String filename) = _LoadFile;
}
