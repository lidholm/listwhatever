import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import '/custom/pages/listItems/service/list_items_service.dart';
import '/custom/pages/lists/user_lists_service.dart';
import '/standard/constants.dart';

import 'list_item_crud_event.dart';
import 'list_item_crud_state.dart';

class ListItemCrudBloc extends Bloc<ListItemCrudEvent, ListItemCrudState> {
  ListItemCrudBloc(this._userListsService, this._listItemsService) : super(ListItemCrudInitial()) {
    on<ChangeUserForListItemCrud>(_onChangeUser);
    on<AddListItem>(_onAddListItem);
    on<UpdateListItem>(_onUpdateListItem);
    on<DeleteListItem>(_onDeleteListItem);
    on<ImportListItems>(_onImportListItems);
  }
  final UserListsService _userListsService;
  final ListItemsService _listItemsService;

  Future<void> _onChangeUser(ChangeUserForListItemCrud event, Emitter<ListItemCrudState> emit) async {
    try {
      emit(ListItemCrudLoading());
      _listItemsService.changeUser(event.userId);
      emit(ListItemCrudChangedUser('Changed user'));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemCrudError('Failed to change user.\n$e'));
    }
  }

  Future<void> _onAddListItem(AddListItem event, Emitter<ListItemCrudState> emit) async {
    try {
      emit(ListItemCrudLoading());
      await _listItemsService.addListItem(event.actualListId, event.listItem);
      emit(ListItemCrudAdded(event.listItem));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemCrudError('Failed to add listItem.\n$e'));
    }
  }

  Future<void> _onUpdateListItem(UpdateListItem event, Emitter<ListItemCrudState> emit) async {
    logger.i('$this => updating list item for list ${event.actualListId}');
    try {
      emit(ListItemCrudLoading());
      await _listItemsService.updateListItem(event.actualListId, event.listItem);
      emit(ListItemCrudUpdated(event.listItem));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemCrudError('Failed to update listItem.\n$e'));
    }
  }

  Future<void> _onDeleteListItem(DeleteListItem event, Emitter<ListItemCrudState> emit) async {
    logger.i('$this => deleting list item for list ${event.actualListId}');
    try {
      emit(ListItemCrudLoading());
      await _listItemsService.deleteListItem(event.actualListId, event.listItemId);
      emit(ListItemCrudDeleted(event.listItemId));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemCrudError('Failed to delete listItem.\n$e'));
    }
  }

  Future<void> _onImportListItems(ImportListItems event, Emitter<ListItemCrudState> emit) async {
    logger.i('$this => import list items for list ${event.actualListId}');
    try {
      emit(ListItemCrudLoading());
      final originalListItems = await _listItemsService.getListItems(event.actualListId).first;

      for (final listItem in event.listItems) {
        final existingListItem = originalListItems.firstWhereOrNull((element) => element.name == listItem.name);
        if (existingListItem != null) {
          await _listItemsService.updateListItem(event.actualListId, listItem.copyWith(id: existingListItem.id));
        } else {
          await _listItemsService.addListItem(event.actualListId, listItem);
        }
      }
      emit(ListItemCrudImported(event.listItems));
      // emit(ListItemLoading());
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemCrudError('Failed to import listItems.\n$e'));
    }
  }
}
