import 'package:bloc/bloc.dart';
import 'package:listwhatever/custom/pages/listItems/list_item.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_service.dart';
import 'package:listwhatever/custom/pages/lists/user_lists_service.dart';

import '/standard/constants.dart';
import 'list_items_load_event.dart';
import 'list_items_load_state.dart';

class ListItemsLoadBloc extends Bloc<ListItemsLoadEvent, ListItemsLoadState> {
  ListItemsLoadBloc(this._userListsService, this._listItemsService) : super(ListItemsLoadInitial()) {
    on<ChangeUserForListItemsLoad>(_onChangeUser);
    on<LoadListItems>(_onLoadListItems);
    on<WatchListItems>(_onWatchListItems);
  }
  final UserListsService _userListsService;
  final ListItemsService _listItemsService;

  Future<void> _onChangeUser(ChangeUserForListItemsLoad event, Emitter<ListItemsLoadState> emit) async {
    try {
      emit(ListItemsLoadLoading());
      _listItemsService.changeUser(event.userId);
      emit(ListItemsLoadLoaded(const []));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemsLoadError('Failed to change user.\n$e'));
    }
  }

  Future<void> _onLoadListItems(LoadListItems event, Emitter<ListItemsLoadState> emit) async {
    logger.i('$this => loading list item for list ${event.listId}');
    try {
      emit(ListItemsLoadLoading());
      final userList = await _userListsService.getList(event.listId);
      final listItems = await _listItemsService.getListItems(userList.listId).first;
      emit(ListItemsLoadLoaded(listItems));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemsLoadError('Failed to load listItems.\n$e'));
    }
  }

  Future<void> _onWatchListItems(WatchListItems event, Emitter<ListItemsLoadState> emit) async {
    logger.i('$this => loading list item for list ${event.listId}');
    try {
      emit(ListItemsLoadLoading());
      final userList = await _userListsService.getList(event.listId);
      await emit.forEach(
        _listItemsService.getListItems(userList.listId),
        onData: (List<ListItem> listItems) {
          return ListItemsLoadLoaded(listItems);
        },
      );
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemsLoadError('Failed to load listItems.\n$e'));
    }
  }
}
