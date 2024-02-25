import 'package:bloc/bloc.dart';
import '/custom/pages/listItems/service/list_items_service.dart';
import '/custom/pages/lists/user_lists_service.dart';
import '/standard/constants.dart';
import 'list_item_load_event.dart';
import 'list_item_load_state.dart';

class ListItemLoadBloc extends Bloc<ListItemLoadEvent, ListItemLoadState> {
  ListItemLoadBloc(this._userListsService, this._listItemsService) : super(ListItemLoadInitial()) {
    on<ChangeUserForListItemLoad>(_onChangeUser);
    on<LoadListItem>(_onLoadListItem);
  }
  final UserListsService _userListsService;
  final ListItemsService _listItemsService;

  Future<void> _onChangeUser(ChangeUserForListItemLoad event, Emitter<ListItemLoadState> emit) async {
    try {
      emit(ListItemLoadLoading());
      _listItemsService.changeUser(event.userId);
      emit(ListItemLoadLoaded(null));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemLoadError('Failed to change user.\n$e'));
    }
  }

  Future<void> _onLoadListItem(LoadListItem event, Emitter<ListItemLoadState> emit) async {
    logger.i('$this => loading list item ${event.listItemId} for list ${event.listId}');
    try {
      emit(ListItemLoadLoading());
      final userList = await _userListsService.getList(event.listId);
      final listItem = await _listItemsService.getListItem(userList.listId, event.listItemId);
      emit(ListItemLoadLoaded(listItem));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemLoadError('Failed to load listItem.\n$e'));
    }
  }
}
