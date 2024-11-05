import 'package:bloc/bloc.dart';
import '/standard/firebase/firestore_service.dart';
import '/standard/userRepository/models/user.dart';

part 'change_user_bloc_event.dart';
part 'change_user_bloc_state.dart';

class ChangeUserBloc extends Bloc<ChangeUserEvent, ChangeUserState> {
  ChangeUserBloc({required this.services}) : super(UserLoaded(null)) {
    on<ChangeUserEvent>(_onChangeUserEvent);
  }
  final List<FirestoreService> services;

  void _onChangeUserEvent(
    ChangeUserEvent event,
    Emitter<ChangeUserState> emit,
  ) {
    // LoggerHelper.logger.i('$className => event.user: ${event.user}');
    final userId =
        (event.user == null || event.user!.id.isEmpty) ? null : event.user!.id;
    // LoggerHelper.logger.i('$className => userId: $userId   QQQ');
    for (final service in services) {
      // LoggerHelper.logger.i('$className => service: $service   QQQ');
      service.changeUser(userId);
    }
  }
}
