import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listwhatever/custom/pages/lists/user_lists_service.dart';
import 'package:listwhatever/standard/firebase/firebase_storage.dart';
import 'package:listwhatever/standard/helpers/logger_helper.dart';

part 'firebase_storage_event.dart';
part 'firebase_storage_state.dart';
part 'firebase_storage_bloc.freezed.dart';

const String className = 'FirebaseStorageBloc';

class FirebaseStorageBloc
    extends Bloc<FirebaseStorageEvent, FirebaseStorageState> {
  FirebaseStorageBloc({
    required this.userListsService,
  }) : super(const Initial()) {
    on<_LoadFiles>(_onLoadFiles);
    on<_GetAllUserLists>(_onGetAllUserLists);
  }
  final Map<String, String> loadedFiles = {'default': 'generic.jpg'};
  final UserListsService userListsService;

  Future<void> _onLoadFiles(
    _LoadFiles event,
    Emitter<FirebaseStorageState> emit,
  ) async {
    emit(const Loading());
    LoggerHelper.logger.i('$className: onLoadFile: ${event.filenames}');

    final urls = <String, String>{};

    for (final filename in event.filenames) {
      if (loadedFiles.containsKey(filename)) {
        LoggerHelper.logger.i(
          '$className: already loaded, just returning: $filename => ${loadedFiles[filename]}',
        );
      } else {
        final imageUrl = await (await getFirebaseStorage())
            .ref()
            .child('images')
            .child(filename)
            .getDownloadURL();
        // LoggerHelper.logger.i('$className: imageUrl: $imageUrl');
        loadedFiles[filename] = imageUrl;
      }

      urls[filename] = loadedFiles[filename]!;
    }

    emit(FilesLoaded(urls));
  }

  Future<void> _onGetAllUserLists(
    _GetAllUserLists event,
    Emitter<FirebaseStorageState> emit,
  ) async {
    emit(const Loading());

    final userLists = await userListsService.getUserLists().first;
    final allImages = userLists
        .map((list) => list.imageFilename)
        .where((i) => i != null)
        .map((image) => image!)
        .toList();

    final urls = <String, String>{};

    for (final filename in allImages) {
      if (loadedFiles.containsKey(filename)) {
        LoggerHelper.logger.i(
          '$className: already loaded, just returning: $filename => ${loadedFiles[filename]}',
        );
      } else {
        final imageUrl = await (await getFirebaseStorage())
            .ref()
            .child('images')
            .child(filename)
            .getDownloadURL();
        // LoggerHelper.logger.i('$className: imageUrl: $imageUrl');
        loadedFiles[filename] = imageUrl;
      }

      urls[filename] = loadedFiles[filename]!;
    }

    emit(FilesLoaded(urls));
  }
}
