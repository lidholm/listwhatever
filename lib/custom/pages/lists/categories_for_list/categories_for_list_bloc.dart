import 'package:bloc/bloc.dart';
import '/custom/pages/lists/lists_service.dart';

import 'categories_for_list_event.dart';
import 'categories_for_list_state.dart';

class CategoriesForListBloc
    extends Bloc<CategoriesForListEvent, CategoriesForListState> {
  CategoriesForListBloc(this._listsService)
      : super(CategoriesForListInitial()) {
    on<ChangeUserForCategoriesForList>(_onChangeUserForCategoriesForList);
    on<LoadCategoriesForList>(_onLoadCategoriesForList);
  }
  static String className = 'ListLoadBloc';
  final ListsService _listsService;

  Future<void> _onChangeUserForCategoriesForList(
    ChangeUserForCategoriesForList event,
    Emitter<CategoriesForListState> emit,
  ) async {
    try {
      // logger.e('$className: event: $event');
      emit(CategoriesForListLoading());
      _listsService.changeUser(event.userId);
      emit(CategoriesForListLoaded(const {}));
    } catch (e) {
      emit(CategoriesForListError('Failed to change user.\n$e'));
    }
  }

  Future<void> _onLoadCategoriesForList(
    LoadCategoriesForList event,
    Emitter<CategoriesForListState> emit,
  ) async {
    //
    try {
      emit(CategoriesForListLoading());
      final categoriesForList =
          await _listsService.getCategoriesForList(event.listId);

      emit(CategoriesForListLoaded(categoriesForList));
    } catch (e) {
      emit(CategoriesForListError('Failed to load categories for list.\n$e'));
    }
  }
}
