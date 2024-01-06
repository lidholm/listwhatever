import 'package:bloc/bloc.dart';
import '/custom/firestore/listItems/list_item.dart';
import '/custom/firestore/lists/user_lists_service.dart';
import '/standard/constants.dart';

import '../list_items_service.dart';
import 'list_items_event.dart';
import 'list_items_state.dart';

class ListItemsBloc extends Bloc<ListItemsEvent, ListItemsState> {
  ListItemsBloc(this._userListsService, this._listItemsService) : super(ListItemsInitial()) {
    on<ChangeUserForListItems>(_onChangeUser);
    on<AddListItem>(_onAddListItem);
    on<WatchListItems>(_onWatchListItems);
    on<LoadListItems>(_onLoadListItems);
  }
  final UserListsService _userListsService;
  final ListItemsService _listItemsService;

  Future<void> _onChangeUser(ChangeUserForListItems event, Emitter<ListItemsState> emit) async {
    try {
      emit(ListItemsLoading());
      _listItemsService.changeUser(event.userId);
      emit(ListItemsLoaded(const []));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemsError('Failed to change user.\n$e'));
    }
  }

  Future<void> _onWatchListItems(WatchListItems event, Emitter<ListItemsState> emit) async {
    final userList = await _userListsService.getList(event.listId);
    await emit.forEach(_listItemsService.getListItems(userList.listId),
        onData: (List<ListItem> listItems) {
          return ListItemsLoaded(listItems);
        },);
  }

  Future<void> _onLoadListItems(LoadListItems event, Emitter<ListItemsState> emit) async {
    final userList = await _userListsService.getList(event.listId);
    final listItems = await _listItemsService.getListItems(userList.listId).first;

    emit(ListItemsLoaded(listItems));
  }

  Future<void> _onAddListItem(AddListItem event, Emitter<ListItemsState> emit) async {
    try {
      final userList = await _userListsService.getList(event.listId);
      await _listItemsService.addListItem(userList.listId, event.item);
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemsError('Failed to add listItem.\n$e'));
    }
  }

}
