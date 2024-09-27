part of 'firebase_storage_bloc.dart';

@freezed
class FirebaseStorageEvent with _$FirebaseStorageEvent {
  const factory FirebaseStorageEvent.loadFiles(List<String> filenames) =
      _LoadFiles;
}
