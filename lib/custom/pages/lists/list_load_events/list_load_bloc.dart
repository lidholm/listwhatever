import 'package:bloc/bloc.dart';
import '/custom/pages/lists/lists_service.dart';

import 'list_load_event.dart';
import 'list_load_state.dart';

class ListLoadBloc extends Bloc<ListLoadEvent, ListLoadState> {
  ListLoadBloc(this._listsService) : super(ListLoadInitial()) {
    on<ChangeUserForListLoad>(_onChangeUser);
    on<LoadList>(_onLoadList);
  }
  static String className = 'ListLoadBloc';
  final ListsService _listsService;

  Future<void> _onChangeUser(
    ChangeUserForListLoad event,
    Emitter<ListLoadState> emit,
  ) async {
    try {
      // logger.e('$className: event: $event');
      emit(ListLoadLoading());
      _listsService.changeUser(event.userId);

      emit(ListLoadLoaded(null));
    } catch (e) {
      emit(ListLoadError('Failed to change user.\n$e'));
    }
  }

  Future<void> _onLoadList(LoadList event, Emitter<ListLoadState> emit) async {
    //
    try {
      emit(ListLoadLoading());
      final list = await _listsService.getList(event.listId);

      emit(ListLoadLoaded(list));
    } catch (e) {
      print('$className _onLoadList Error: $e');

      emit(ListLoadError('Failed to load lists.\n$e'));
    }
  }
}
