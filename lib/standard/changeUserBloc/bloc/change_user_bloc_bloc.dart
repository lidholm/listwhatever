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
    //
    final userId =
        (event.user == null || event.user!.id.isEmpty) ? null : event.user!.id;
    //
    for (final service in services) {
      //
      service.changeUser(userId);
    }
  }
}
