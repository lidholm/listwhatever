import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/firebase/firebase_storage.dart';

part 'firebase_storage_event.dart';
part 'firebase_storage_state.dart';
part 'firebase_storage_bloc.freezed.dart';

const String className = 'FirebaseStorageBloc';

class FirebaseStorageBloc
    extends Bloc<FirebaseStorageEvent, FirebaseStorageState> {
  FirebaseStorageBloc() : super(const Initial()) {
    on<_LoadFiles>(_onLoadFiles);
  }
  final Map<String, String> loadedFiles = {};

  Future<void> _onLoadFiles(
    _LoadFiles event,
    Emitter<FirebaseStorageState> emit,
  ) async {
    emit(const Loading());
    logger.i('$className: onLoadFile: ${event.filenames}');

    final urls = <String>[];

    for (final filename in event.filenames) {
      if (loadedFiles.containsKey(filename)) {
        logger.i(
          '$className: already loaded, just returning: $filename => ${loadedFiles[filename]}',
        );
      } else {
        final imageUrl = await (await getFirebaseStorage())
            .ref()
            .child('images')
            .child(filename)
            .getDownloadURL();
        logger.i('$className: imageUrl: $imageUrl');
        loadedFiles[filename] = imageUrl;
      }
    }

    emit(FilesLoaded(urls));
  }
}
