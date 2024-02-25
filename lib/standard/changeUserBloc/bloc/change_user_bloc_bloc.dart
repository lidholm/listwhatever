import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/userRepository/models/user.dart';

part 'change_user_bloc_event.dart';
part 'change_user_bloc_state.dart';

class ChangeUserBlocBloc extends Bloc<ChangeUserEvent, ChangeUserState> {
  ChangeUserBlocBloc() : super(UserLoaded(null)) {
    on<ChangeUserEvent>(_onChangeUserEvent);
  }

  void _onChangeUserEvent(ChangeUserEvent event, Emitter<ChangeUserState> emit) {
    logger.i('$this => ${event.user}');
    if (event.user == null || event.user!.id.isEmpty) {
      emit(UserLoaded(null));
    } else {
      emit(UserLoaded(event.user));
    }
  }
}
