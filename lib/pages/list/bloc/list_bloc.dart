import 'package:bloc/bloc.dart';
import 'package:listwhatever/pages/list/bloc/list_event.dart';
import 'package:listwhatever/pages/list/bloc/list_state.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';
import 'package:listwhatever/pages/lists/repository/list_repository.dart';
import 'package:listwhatever/pages/lists/repository/user_list_repository.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc({
    required this.listRepository,
    required this.userListRepository,
  }) : super(ListInitial()) {
    on<AddList>(_onAddList);
  }
  final UserListRepository userListRepository;
  final ListRepository listRepository;

  Future<void> _onAddList(
    AddList event,
    Emitter<ListState> emit,
  ) async {
    emit(ListLoading());
    final listId = await listRepository.addList(event.list);

    final userList = UserList.fromList(event.list, listId);
    await userListRepository.addUserList(userList);
  }
}
