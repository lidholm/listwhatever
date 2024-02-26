import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/firebaseService/firebase_service.dart';
import 'package:listwhatever/standard/userRepository/models/user.dart';

part 'change_user_bloc_event.dart';
part 'change_user_bloc_state.dart';

class ChangeUserBlocBloc extends Bloc<ChangeUserEvent, ChangeUserState> {
  ChangeUserBlocBloc({required this.services}) : super(UserLoaded(null)) {
    on<ChangeUserEvent>(_onChangeUserEvent);
  }
  final List<FirestoreService> services;

  void _onChangeUserEvent(ChangeUserEvent event, Emitter<ChangeUserState> emit) {
    logger.i('$this => event.user: ${event.user}');
    final userId = (event.user == null || event.user!.id.isEmpty) ? null : event.user!.id;
    logger.i('$this => userId: $userId   QQQ');
    for (final service in services) {
      logger.i('$this => service: $service   QQQ');
      service.changeUser(userId);
    }
  }
}
