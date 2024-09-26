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
    on<_LoadFile>(
      (event, emit) async {
        emit(const Loading());

        logger.i('$className: onLoadFile: ${event.filename}');

        final imageUrl = await (await getFirebaseStorage())
            .ref()
            .child('images')
            .child(event.filename)
            .getDownloadURL();
        logger.i('$className: imageUrl: $imageUrl');

        emit(FileLoaded(imageUrl));
      },
    );
  }
}
