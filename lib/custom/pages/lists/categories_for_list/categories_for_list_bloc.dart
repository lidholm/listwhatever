import 'package:bloc/bloc.dart';
import '/custom/pages/lists/lists_service.dart';

import '/standard/constants.dart';
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
      logger.e('$className _onChangeUser Error: $e');
      emit(CategoriesForListError('Failed to change user.\n$e'));
    }
  }

  Future<void> _onLoadCategoriesForList(
    LoadCategoriesForList event,
    Emitter<CategoriesForListState> emit,
  ) async {
    // logger.i('$className => getting list  ${event.listId}');
    try {
      emit(CategoriesForListLoading());
      final categoriesForList =
          await _listsService.getCategoriesForList(event.listId);
      emit(CategoriesForListLoaded(categoriesForList));
    } catch (e) {
      logger.e('$className _onLoadList Error: $e');
      emit(CategoriesForListError('Failed to load categories for list.\n$e'));
    }
  }
}
