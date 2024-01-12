import 'package:bloc/bloc.dart';
import '/custom/pages/listItems/list_items_service.dart';
import '/custom/pages/lists/user_lists_service.dart';
import '/standard/constants.dart';
import 'list_item_load_event.dart';
import 'list_item_load_state.dart';

class ListItemLoadBloc extends Bloc<ListItemLoadEvent, ListItemState> {
  ListItemLoadBloc(this._userListsService, this._listItemsService) : super(ListItemInitial()) {
    on<ChangeUserForListItemLoad>(_onChangeUser);
    on<LoadListItem>(_onLoadListItem);
  }
  final UserListsService _userListsService;
  final ListItemsService _listItemsService;

  Future<void> _onChangeUser(ChangeUserForListItemLoad event, Emitter<ListItemState> emit) async {
    try {
      emit(ListItemLoading());
      _listItemsService.changeUser(event.userId);
      emit(ListItemLoaded(null));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemError('Failed to change user.\n$e'));
    }
  }

  Future<void> _onLoadListItem(LoadListItem event, Emitter<ListItemState> emit) async {
    logger.i('loading list item for list ${event.listId}');
    try {
      emit(ListItemLoading());
      final userList = await _userListsService.getList(event.listId);
      final listItem = await _listItemsService.getListItem(userList.listId, event.listItemId);
      emit(ListItemLoaded(listItem));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemError('Failed to load listItem.\n$e'));
    }
  }
}
