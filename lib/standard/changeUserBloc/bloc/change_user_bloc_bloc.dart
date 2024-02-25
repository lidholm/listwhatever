import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_user_bloc_event.dart';
part 'change_user_bloc_state.dart';
part 'change_user_bloc_bloc.freezed.dart';

class ChangeUserBlocBloc extends Bloc<ChangeUserBlocEvent, ChangeUserBlocState> {
  ChangeUserBlocBloc() : super(_Initial()) {
    on<ChangeUserBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
