import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedListItemCubit extends Cubit<String?> {
  SelectedListItemCubit() : super(null);

  void click(String? itemId) => emit(state == itemId ? null : itemId);
}
