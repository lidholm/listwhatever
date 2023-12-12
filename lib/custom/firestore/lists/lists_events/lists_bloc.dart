import 'package:bloc/bloc.dart';
import 'package:listanything/custom/firestore/lists/list_of_things.dart';
import 'package:listanything/standard/constants.dart';

import '../lists_service.dart';
import 'lists_event.dart';
import 'lists_state.dart';

class ListsBloc extends Bloc<ListsEvent, ListsState> {
  ListsBloc(this._listsService) : super(ListsInitial()) {
    on<ChangeUserForLists>(_onChangeUser);
    on<WatchLists>(_onWatchLists);
    on<AddList>(_onAddList);
  }
  final ListsService _listsService;

  Future<void> _onChangeUser(ChangeUserForLists event, Emitter<ListsState> emit) async {
    try {
      emit(ListsLoading());
      _listsService.changeUser(event.userId);
      emit(ListsLoaded(const []));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListsError('Failed to change user.\n$e'));
    }
  }

  Future<void> _onWatchLists(WatchLists event, Emitter<ListsState> emit) async {
    await emit.forEach(_listsService.getLists(),
      onData: (List<ListOfThings> lists) {
        return ListsLoaded(lists);
      },);
  }

  Future<void> _onAddList(AddList event, Emitter<ListsState> emit) async {
    try {
      emit(ListsLoading());
      await _listsService.addList(event.list);
    } catch (e) {
      logger.e('Error: $e');
      emit(ListsError('Failed to add list.\n$e'));
    }
  }
}
