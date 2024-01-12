import 'package:bloc/bloc.dart';
import 'package:listwhatever/custom/pages/lists/models/user_list.dart';
import '/custom/pages/lists/user_lists_service.dart';

import '/standard/constants.dart';
import 'lists_event.dart';
import 'lists_state.dart';

class ListsLoadBloc extends Bloc<ListsLoadEvent, ListsLoadState> {
  ListsLoadBloc(this._userListsService) : super(ListsLoadInitial()) {
    on<ChangeUserForListsLoad>(_onChangeUser);
    on<WatchLists>(_onWatchUserLists);
  }

  final UserListsService _userListsService;

  Future<void> _onChangeUser(ChangeUserForListsLoad event, Emitter<ListsLoadState> emit) async {
    try {
      emit(ListsLoadLoading());
      _userListsService.changeUser(event.userId);
      emit(ListsLoadLoaded(const []));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListsLoadError('Failed to change user.\n$e'));
    }
  }

  Future<void> _onWatchUserLists(WatchLists event, Emitter<ListsLoadState> emit) async {
    await emit.forEach(
      _userListsService.getLists(),
      onData: (List<UserList> lists) {
        return ListsLoadLoaded(lists);
      },
    );
  }
}
