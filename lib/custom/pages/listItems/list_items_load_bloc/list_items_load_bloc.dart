import 'package:bloc/bloc.dart';
import '/custom/pages/listItems/models/list_item.dart';
import '/custom/pages/listItems/service/list_items_service.dart';

import '/standard/constants.dart';
import 'list_items_load_event.dart';
import 'list_items_load_state.dart';

class ListItemsLoadBloc extends Bloc<ListItemsLoadEvent, ListItemsLoadState> {
  ListItemsLoadBloc(this._listItemsService) : super(ListItemsLoadInitial()) {
    on<ChangeUserForListItemsLoad>(_onChangeUser);
    on<LoadListItems>(_onLoadListItems);
    on<WatchListItems>(_onWatchListItems);
  }
  static String className = 'ListItemsLoadBloc';
  final ListItemsService _listItemsService;

  Future<void> _onChangeUser(
    ChangeUserForListItemsLoad event,
    Emitter<ListItemsLoadState> emit,
  ) async {
    try {
      emit(ListItemsLoadLoading());
      _listItemsService.changeUser(event.userId);
      emit(ListItemsLoadLoaded(const []));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemsLoadError('Failed to change user.\n$e'));
    }
  }

  Future<void> _onLoadListItems(
    LoadListItems event,
    Emitter<ListItemsLoadState> emit,
  ) async {
    logger.i('$className => loading list item for list ${event.actualListId}');
    try {
      emit(ListItemsLoadLoading());
      final listItems =
          await _listItemsService.getListItems(event.actualListId).first;
      emit(ListItemsLoadLoaded(listItems));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListItemsLoadError('Failed to load listItems.\n$e'));
    }
  }

  Future<void> _onWatchListItems(
    WatchListItems event,
    Emitter<ListItemsLoadState> emit,
  ) async {
    // logger.i('$className => loading list item for list ${event.actualListId}');
    try {
      emit(ListItemsLoadLoading());
      await emit.forEach(
        _listItemsService.getListItems(event.actualListId),
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
