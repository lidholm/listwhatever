import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:listwhatever/pages/lists/repository/user_list_repository.dart';

part 'change_user_bloc_event.dart';
part 'change_user_bloc_state.dart';

class ChangeUserBloc extends Bloc<ChangeUserEvent, ChangeUserState> {
  ChangeUserBloc({required this.userListRepository}) : super(UserLoaded(null)) {
    on<ChangeUserEvent>(_onChangeUserEvent);
  }

  final UserListRepository userListRepository;

  void _onChangeUserEvent(
    ChangeUserEvent event,
    Emitter<ChangeUserState> emit,
  ) {
    userListRepository.changeUser(event.userId);
  }
}
