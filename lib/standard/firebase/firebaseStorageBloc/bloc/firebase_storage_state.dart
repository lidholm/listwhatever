part of 'firebase_storage_bloc.dart';

@freezed
sealed class FirebaseStorageState with _$FirebaseStorageState {
  const factory FirebaseStorageState.initial() = Initial;
  const factory FirebaseStorageState.loading() = Loading;
  const factory FirebaseStorageState.filesLoaded(
    Map<String, String> imageUrls,
  ) = FilesLoaded;
}
