import 'package:bloc/bloc.dart';
import 'package:listwhatever/pages/list/bloc/list_event.dart';
import 'package:listwhatever/pages/list/bloc/list_state.dart';
import 'package:listwhatever/pages/list/repository/list_item_repository.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';
import 'package:listwhatever/pages/lists/repository/list_repository.dart';
import 'package:listwhatever/pages/lists/repository/user_list_repository.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc({
    required this.listRepository,
    required this.userListRepository,
    required this.listItemRepository,
  }) : super(ListInitial()) {
    on<AddList>(_onAddList);
    on<AddListItem>(_onAddListItem);
    on<GetList>(_onGetList);
  }
  final UserListRepository userListRepository;
  final ListRepository listRepository;
  final ListItemRepository listItemRepository;

  Future<void> _onAddList(
    AddList event,
    Emitter<ListState> emit,
  ) async {
    emit(ListLoading());
    final listId = await listRepository.addList(event.list);

    final userList = UserList.fromList(event.list, listId);
    await userListRepository.addUserList(userList);
  }

  Future<void> _onGetList(
    GetList event,
    Emitter<ListState> emit,
  ) async {
    emit(ListLoading());
    final list = await listRepository.loadList(event.listId);
    final listItems = await listItemRepository.loadListItems(event.listId);
    emit(ListLoaded(list: list, listItems: listItems));
  }

  Future<void> _onAddListItem(
    AddListItem event,
    Emitter<ListState> emit,
  ) async {
    emit(ListLoading());
    final listItemId =
        await listRepository.addListItem(event.listId, event.listItem);

    final list = await listRepository.loadList(event.listId);
    final listItems = await listItemRepository.loadListItems(event.listId);
    emit(ListLoaded(list: list, listItems: listItems));
  }
}
