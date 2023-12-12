import 'package:bloc/bloc.dart';
import 'package:listanything/custom/firestore/listItems/list_item.dart';
import 'package:listanything/standard/constants.dart';

import '../list_items_service.dart';
import 'list_items_event.dart';
import 'list_items_state.dart';

class ListItemsBloc extends Bloc<ListItemsEvent, ListItemsState> {
  ListItemsBloc(this._listItemsService) : super(ListItemsInitial()) {
    on<ChangeUserForListItems>(_onChangeUser);
    on<AddListItem>(_onAddListItem);
    on<WatchListItems>(_onWatchListItems);
  }
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
    await emit.forEach(_listItemsService.getListItems(event.listId),
        onData: (List<ListItem> listItems) {
          return ListItemsLoaded(listItems);
        },);
  }

  Future<void> _onAddListItem(AddListItem event, Emitter<ListItemsState> emit) async {
    try {
      await _listItemsService.addListItem(event.listId, event.item);
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemsError('Failed to add listItem.\n$e'));
    }
  }

}
