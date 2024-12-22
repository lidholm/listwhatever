import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';
import 'package:listwhatever/pages/lists/repository/user_list_repository.dart';

part 'lists_event.dart';
part 'lists_state.dart';
part 'lists_bloc.freezed.dart';

class ListsBloc extends Bloc<ListsEvent, ListsState> {
  ListsBloc({required this.userListRepository}) : super(const Initial()) {
    on<_WatchUserLists>(_onWatchUserLists);
    on<_AddList>(_onAddList);
  }
  final UserListRepository userListRepository;

  Future<void> _onWatchUserLists(
    _WatchUserLists event,
    Emitter<ListsState> emit,
  ) async {
    emit(const ListsState.loading());

    await emit.forEach(
      userListRepository.loadUserLists(),
      onData: (List<UserList> lists) {
        return ListsState.loaded(lists);
      },
    );
  }

  Future<void> _onAddList(
    _AddList event,
    Emitter<ListsState> emit,
  ) async {
    emit(const ListsState.loading());

    final userList = UserList.fromList(event.list);
    await userListRepository.addUserList(userList);
  }
}
