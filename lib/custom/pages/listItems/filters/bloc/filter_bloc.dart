import 'package:bloc/bloc.dart';
import 'package:listwhatever/custom/pages/listItems/filters/categories_helper.dart';
import 'package:listwhatever/custom/pages/listItems/service/list_items_service.dart';
import '/custom/pages/listItems/filters/filters.dart';
import '/standard/constants.dart';

import 'filter_event.dart';
import 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc(this._listItemsService)
      : super(FiltersUpdated(Filters(regularCategoryFilters: {}))) {
    on<UpdateFilters>(_onUpdateFilters);
    on<UpdateFiltersForSelectedList>(_onUpdateFiltersForSelectedList);
  }
  final ListItemsService _listItemsService;

  Future<void> _onUpdateFilters(
    UpdateFilters event,
    Emitter<FilterState> emit,
  ) async {
    try {
      emit(UpdatingFilters());
      emit(FiltersUpdated(event.filters));
    } catch (e) {
      logger.e('Error: $e');
      emit(FiltersError('Failed to update filters.\n$e'));
    }
  }

  Future<void> _onUpdateFiltersForSelectedList(
    UpdateFiltersForSelectedList event,
    Emitter<FilterState> emit,
  ) async {
    final defaultFilters = Filters(
      regularCategoryFilters: {},
      startDate: DateTime.tryParse('2001-01-01'),
      endDate: DateTime.tryParse('2030-01-01'),
    );

    emit(FiltersUpdated(defaultFilters));
  }
}
