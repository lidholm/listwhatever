import 'package:bloc/bloc.dart';
import '/custom/pages/listItems/service/list_items_service.dart';
import 'list_item_load_event.dart';
import 'list_item_load_state.dart';

class ListItemLoadBloc extends Bloc<ListItemLoadEvent, ListItemLoadState> {
  ListItemLoadBloc(this._listItemsService) : super(ListItemLoadInitial()) {
    on<ChangeUserForListItemLoad>(_onChangeUser);
    on<LoadListItem>(_onLoadListItem);
  }
  static String className = 'ListItemLoadBloc';
  final ListItemsService _listItemsService;

  Future<void> _onChangeUser(
    ChangeUserForListItemLoad event,
    Emitter<ListItemLoadState> emit,
  ) async {
    try {
      emit(ListItemLoadLoading());
      _listItemsService.changeUser(event.userId);
      emit(ListItemLoadLoaded(null));
    } catch (e) {
      emit(ListItemLoadError('Failed to change user.\n$e'));
    }
  }

  Future<void> _onLoadListItem(
    LoadListItem event,
    Emitter<ListItemLoadState> emit,
  ) async {
    //
    //   '$className => loading list item ${event.listItemId} for list ${event.actualListId}',
    // );
    try {
      emit(ListItemLoadLoading());
      final listItem = await _listItemsService.getListItem(
        event.actualListId,
        event.listItemId,
      );
      emit(ListItemLoadLoaded(listItem));
    } catch (e) {
      emit(ListItemLoadError('Failed to load listItem.\n$e'));
    }
  }
}
