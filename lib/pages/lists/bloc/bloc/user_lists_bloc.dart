import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';
import 'package:listwhatever/pages/lists/repository/user_list_repository.dart';

part 'user_lists_event.dart';
part 'user_lists_state.dart';
part 'user_lists_bloc.freezed.dart';

class UserListsBloc extends Bloc<UserListsEvent, UserListsState> {
  UserListsBloc({required this.userListRepository}) : super(const Initial()) {
    on<_WatchUserLists>(_onWatchUserLists);
  }
  final UserListRepository userListRepository;

  Future<void> _onWatchUserLists(
    _WatchUserLists event,
    Emitter<UserListsState> emit,
  ) async {
    emit(const UserListsState.loading());

    await emit.forEach(
      userListRepository.loadUserLists(),
      onData: (List<UserList> lists) {
        return UserListsState.loaded(lists);
      },
    );
  }
}
