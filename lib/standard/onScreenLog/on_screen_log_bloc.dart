import 'package:bloc/bloc.dart';

import 'on_screen_log_event.dart';
import 'on_screen_log_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(Initial()) {
    on<FetchData>((event, emit) async {
      emit(Loading());
      await Future<void>.delayed(const Duration(seconds: 2));
      emit(Success());
    });
  }
}
