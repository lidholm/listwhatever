import 'package:flutter_bloc/flutter_bloc.dart';

class ShowFilterCubit extends Cubit<bool> {
  ShowFilterCubit() : super(false);

  void toggle() => emit(!state);
}
