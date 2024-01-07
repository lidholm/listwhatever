
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import '/custom/firestore/lists/user_lists_service.dart';

import '/standard/constants.dart';
import '../list_items_service.dart';
import 'list_item_event.dart';
import 'list_item_state.dart';

class ListItemBloc extends Bloc<ListItemEvent, ListItemState> {
  ListItemBloc(this._userListsService, this._listItemsService) : super(ListItemInitial()) {
    on<ChangeUserForListItem>(_onChangeUser);
    on<LoadListItem>(_onLoadListItem);
    on<UpdateListItem>(_onUpdateListItem);
    on<DeleteListItem>(_onDeleteListItem);
    on<ImportListItems>(_onImportListItems);
  }
  final UserListsService _userListsService;
  final ListItemsService _listItemsService;

  Future<void> _onChangeUser(ChangeUserForListItem event, Emitter<ListItemState> emit) async {
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

  Future<void> _onUpdateListItem(UpdateListItem event, Emitter<ListItemState> emit) async {
    logger.i('updating list item for list ${event.listId}');
    try {
      final userList = await _userListsService.getList(event.listId);
      await _listItemsService.updateListItem(userList.listId, event.item);
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemError('Failed to update listItem.\n$e'));
    }
  }

  Future<void> _onDeleteListItem(DeleteListItem event, Emitter<ListItemState> emit) async {
    logger.i('deleting list item for list ${event.listId}');
    try {
      final userList = await _userListsService.getList(event.listId);
      await _listItemsService.deleteListItem(userList.listId, event.listItemId);
      emit(ListItemDeleted(event.listId, event.listItemId));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemError('Failed to delete listItem.\n$e'));
    }
  }

  Future<void> _onImportListItems(ImportListItems event, Emitter<ListItemState> emit) async {
    logger.i('import list items for list ${event.listId}');
    try {
      emit(ListItemLoading());
      final userList = await _userListsService.getList(event.listId);
      final originalListItems = await _listItemsService.getListItems(userList.listId).first;

      for (final listItem in event.listItems) {
        final existingListItem = originalListItems.firstWhereOrNull((element) => element.name == listItem.name);
        if (existingListItem != null) { // TODO: Should probably have an event for Import instead?
          await _listItemsService.updateListItem(userList.listId, listItem.copyWith(id: existingListItem.id));
        } else {
          await _listItemsService.addListItem(userList.listId, listItem);
        }
      }
      emit(ListItemsImported(event.listId));
      // emit(ListItemLoading());
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemError('Failed to load listItem.\n$e'));
    }
  }
}
