import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';
import 'package:listwhatever/pages/lists/repository/list_repository.dart';
import 'package:listwhatever/pages/lists/repository/user_list_repository.dart';

part 'list_event.dart';
part 'list_state.dart';
part 'list_bloc.freezed.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc({
    required this.listRepository,
    required this.userListRepository,
  }) : super(const _Initial()) {
    on<_AddList>(_onAddList);
  }
  final UserListRepository userListRepository;
  final ListRepository listRepository;

  Future<void> _onAddList(
    _AddList event,
    Emitter<ListState> emit,
  ) async {
    emit(const ListState.loading());
    final listId = await listRepository.addList(event.list);

    final userList = UserList.fromList(event.list, listId);
    await userListRepository.addUserList(userList);
  }
}
