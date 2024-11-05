import 'package:bloc/bloc.dart';
import 'package:listwhatever/standard/helpers/logger_helper.dart';
import '/custom/pages/shareList/shared_lists_service.dart';

import 'shared_list_event.dart';
import 'shared_list_state.dart';

class SharedListBloc extends Bloc<SharedListEvent, SharedListState> {
  SharedListBloc(this._sharedListsService) : super(SharedListInitial()) {
    on<LoadSharedList>(_onLoadSharedList);
  }

  final SharedListsService _sharedListsService;

  Future<void> _onLoadSharedList(
    LoadSharedList event,
    Emitter<SharedListState> emit,
  ) async {
    // LoggerHelper.logger.i('$className => _onLoadSharedList');
    try {
      emit(SharedListLoading());
      final sharedList =
          await _sharedListsService.getSharedList(event.shareCode);
      emit(SharedListLoaded(sharedList));
    } catch (e) {
      LoggerHelper.logger.e('Error: $e');
      emit(SharedListError('Failed to load shared lists.\n$e'));
    }
  }
}
