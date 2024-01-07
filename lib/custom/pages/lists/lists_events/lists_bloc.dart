import 'package:bloc/bloc.dart';
import '/custom/pages/lists/lists_service.dart';
import '/custom/pages/lists/user_list.dart';
import '/custom/pages/lists/user_lists_service.dart';

import '/standard/constants.dart';
import 'lists_event.dart';
import 'lists_state.dart';

class ListsBloc extends Bloc<ListsEvent, ListsState> {
  ListsBloc(this._listService, this._userListsService) : super(ListsInitial()) {
    on<ChangeUserForLists>(_onChangeUser);
    on<WatchLists>(_onWatchUserLists);
    on<AddList>(_onAddUserList);
  }

  final ListsService _listService;
  final UserListsService _userListsService;

  Future<void> _onChangeUser(ChangeUserForLists event, Emitter<ListsState> emit) async {
    try {
      emit(ListsLoading());
      _userListsService.changeUser(event.userId);
      emit(ListsLoaded(const []));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListsError('Failed to change user.\n$e'));
    }
  }

  Future<void> _onWatchUserLists(WatchLists event, Emitter<ListsState> emit) async {
    await emit.forEach(
      _userListsService.getLists(),
      onData: (List<UserList> lists) {
        return ListsLoaded(lists);
      },
    );
  }

  Future<void> _onAddUserList(AddList event, Emitter<ListsState> emit) async {
    try {
      emit(ListsLoading());
      final list = event.list.copyWith(ownerId: _listService.userId);
      final listId = await _listService.addList(event.list);
      final userList = UserList(
        id: '',
        listId: listId,
        listName: list.name,
        listType: list.listType,
        ownerId: list.ownerId!,
        isOwnList: true,
      );
      await _userListsService.addList(userList);
    } catch (e) {
      logger.e('Error: $e');
      emit(ListsError('Failed to add list.\n$e'));
    }
  }
}
