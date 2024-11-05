import 'package:bloc/bloc.dart';
import 'package:listwhatever/standard/helpers/logger_helper.dart';
import '/custom/pages/lists/lists_service.dart';
import '/custom/pages/shareList/shared_lists_service.dart';

import 'subscribe_list_event.dart';
import 'subscribe_list_state.dart';

class SubscribeListBloc extends Bloc<SubscribeListEvent, SubscribeListState> {
  SubscribeListBloc(
    this._sharedListsService,
    this._listService,
  ) : super(SubscribeListInitial()) {
    on<SubscribeListForUser>(_onSubscribeListForUser);
  }

  final SharedListsService _sharedListsService;
  final ListsService _listService;

  Future<void> _onSubscribeListForUser(
    SubscribeListForUser event,
    Emitter<SubscribeListState> emit,
  ) async {
    // LoggerHelper.logger.i('$className => _onLoadSharedList');
    try {
      emit(SubscribeListLoading());
      final userId = _listService.userId!;

      final sharedList =
          await _sharedListsService.getSharedList(event.shareCode);

      await _sharedListsService.addUser(event.shareCode, userId);

      emit(SubscribeListLoaded(sharedList));
    } catch (e) {
      LoggerHelper.logger.e('Error: $e');
      emit(SubscribeListError('Failed to load shared lists.\n$e'));
    }
  }
}
