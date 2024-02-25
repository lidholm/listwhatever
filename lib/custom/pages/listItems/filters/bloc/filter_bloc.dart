import 'package:bloc/bloc.dart';
import '/custom/pages/listItems/filters/filters.dart';
import '/standard/constants.dart';

import 'filter_event.dart';
import 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FiltersUpdated(Filters(categoryFilters: {}))) {
    on<UpdateFilters>(_onUpdateFilters);
  }

  Future<void> _onUpdateFilters(UpdateFilters event, Emitter<FilterState> emit) async {
    try {
      emit(UpdatingFilters());
      emit(FiltersUpdated(event.filters));
    } catch (e) {
      logger.e('Error: $e');
      emit(FiltersError('Failed to update filters.\n$e'));
    }
  }
}
