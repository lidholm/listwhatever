import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';
import 'package:listwhatever/pages/lists/repository/list_repository.dart';
import 'package:listwhatever/pages/lists/repository/user_list_repository.dart';

part 'lists_event.dart';
part 'lists_state.dart';
part 'lists_bloc.freezed.dart';

class ListsBloc extends Bloc<ListsEvent, ListsState> {
  ListsBloc({
    required this.listRepository,
    required this.userListRepository,
  }) : super(const Initial()) {
    on<_WatchUserLists>(_onWatchUserLists);
  }
  final UserListRepository userListRepository;
  final ListRepository listRepository;

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
}
