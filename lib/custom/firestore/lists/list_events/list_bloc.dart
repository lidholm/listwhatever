import 'package:bloc/bloc.dart';
import 'package:listanything/custom/firestore/lists/user_lists_service.dart';
import 'package:listanything/standard/constants.dart';

import '../lists_service.dart';
import 'list_event.dart';
import 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc(this._userListsService, this._listsService) : super(ListInitial()) {
    on<ChangeUserForList>(_onChangeUser);
    on<LoadList>(_onLoadList);
    on<UpdateList>(_onUpdateList);
    on<DeleteList>(_onDeleteList);

  }
  final UserListsService _userListsService;
  final ListsService _listsService;

  Future<void> _onChangeUser(ChangeUserForList event, Emitter<ListState> emit) async {
    try {
      emit(ListLoading());
      _listsService.changeUser(event.userId);
      emit(ListLoaded(null));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListError('Failed to change user.\n$e'));
    }
  }

  Future<void> _onLoadList(LoadList event, Emitter<ListState> emit) async {
    // logger.i('_onLoadList');
    try {
      emit(ListLoading());
      final userList = await _userListsService.getList(event.listId);
      final list = await _listsService.getList(userList.listId);
      emit(ListLoaded(list));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListError('Failed to load lists.\n$e'));
    }
  }

  Future<void> _onUpdateList(UpdateList event, Emitter<ListState> emit) async {
      // logger.i('_onUpdateList');
    try {
      emit(ListLoading());
      await _listsService.updateList(event.list);
      emit(ListLoaded(event.list));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListError('Failed to update list.\n$e'));
    }
  }

  Future<void> _onDeleteList(DeleteList event, Emitter<ListState> emit) async {
    // logger.i('_onDeleteList');
    try {
      emit(ListLoading());
      await _listsService.deleteList(event.listId);
      emit(ListDeleted(event.listId));

    } catch (e) {
      logger.e('Error: $e');
      emit(ListError('Failed to delete list.\n$e'));
    }
  }
}
