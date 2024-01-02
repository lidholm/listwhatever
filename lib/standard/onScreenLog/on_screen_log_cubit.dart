import 'package:bloc/bloc.dart';


class OnScreenLogsCubit extends Cubit<List<String>> {
  /// {@macro counter_cubit}
  OnScreenLogsCubit() : super([]);

  void log(String message) => emit([...state, message]);
}
