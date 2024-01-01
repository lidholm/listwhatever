import 'package:bloc/bloc.dart';
import 'package:allmylists/standard/constants.dart';

import '../list_items_service.dart';
import 'list_item_event.dart';
import 'list_item_state.dart';

class ListItemBloc extends Bloc<ListItemEvent, ListItemState> {
  ListItemBloc(this._listItemsService) : super(ListItemInitial()) {
    on<ChangeUserForListItem>(_onChangeUser);
    on<LoadListItem>(_onLoadListItem);
    on<UpdateListItem>(_onUpdateListItem);
    on<DeleteListItem>(_onDeleteListItem);
  }
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
    try {
      emit(ListItemLoading());
      final listItem = await _listItemsService.getListItem(event.listId, event.listItemId);
      emit(ListItemLoaded(listItem));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemError('Failed to load listItem.\n$e'));
    }
  }
  Future<void> _onUpdateListItem(UpdateListItem event, Emitter<ListItemState> emit) async {
    try {
      await _listItemsService.updateListItem(event.listId, event.item);
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemError('Failed to update listItem.\n$e'));
    }
  }

  Future<void> _onDeleteListItem(DeleteListItem event, Emitter<ListItemState> emit) async {
    try {
      await _listItemsService.deleteListItem(event.listId, event.listItemId);
      emit(ListItemDeleted(event.listId, event.listItemId));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemError('Failed to delete listItem.\n$e'));
    }
  }
}
