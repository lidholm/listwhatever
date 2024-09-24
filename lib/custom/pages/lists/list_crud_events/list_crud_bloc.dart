import 'package:bloc/bloc.dart';

import '/custom/pages/lists/lists_service.dart';
import '/custom/pages/lists/models/user_list.dart';
import '/custom/pages/lists/user_lists_service.dart';
import '/standard/constants.dart';
import 'list_crud_event.dart';
import 'list_crud_state.dart';

class ListCrudBloc extends Bloc<ListCrudEvent, ListCrudState> {
  ListCrudBloc(this._userListsService, this._listsService)
      : super(ListCrudInitial()) {
    on<ChangeUserForListCrud>(_onChangeUser);
    on<AddList>(_onAddList);
    on<UpdateList>(_onUpdateList);
    on<DeleteList>(_onDeleteList);
  }
  final UserListsService _userListsService;
  final ListsService _listsService;

  Future<void> _onChangeUser(
    ChangeUserForListCrud event,
    Emitter<ListCrudState> emit,
  ) async {
    try {
      emit(ListCrudLoading());
      _listsService.changeUser(event.userId);
      emit(ListCrudChangedUser('Changed user for ListCrud'));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListCrudError('Failed to change user.\n$e'));
    }
  }

  Future<void> _onAddList(AddList event, Emitter<ListCrudState> emit) async {
    try {
      emit(ListCrudLoading());
      final list = event.list.copyWith(ownerId: _listsService.userId);
      final actualListId = await _listsService.addList(event.list);
      final userList = UserList(
        id: '',
        imageFilename: list.imageFilename,
        listId: actualListId,
        listName: list.name,
        listType: list.listType,
        ownerId: list.ownerId!,
        isOwnList: true,
      );
      await _userListsService.addList(userList);
      emit(ListCrudAdded(event.list));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListCrudError('Failed to add list.\n$e'));
    }
  }

  Future<void> _onUpdateList(
    UpdateList event,
    Emitter<ListCrudState> emit,
  ) async {
    // logger.i('$className => _onUpdateList');
    try {
      emit(ListCrudLoading());
      await _listsService.updateList(event.list);
      emit(ListCrudUpdated(event.list));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListCrudError('Failed to update list.\n$e'));
    }
  }

  Future<void> _onDeleteList(
    DeleteList event,
    Emitter<ListCrudState> emit,
  ) async {
    logger
      ..i('_onDeleteList')
      ..i('_listsService.userId: ${_listsService.userId}');
    try {
      emit(ListCrudLoading());
      await _userListsService.deleteList(event.listId);
      // TODO: Should the main list be deleted too? How about if it is shared?
      emit(ListCrudDeleted(event.listId));
    } catch (e) {
      logger.e('Error: $e');
      emit(ListCrudError('Failed to delete list.\n$e'));
    }
  }
}
