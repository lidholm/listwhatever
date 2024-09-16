import 'package:flutter_bloc/flutter_bloc.dart';

class ListTypeCubit extends Cubit<ListType> {
  ListTypeCubit() : super(ListType.tiles);

  void toggle() =>
      emit(state == ListType.list ? ListType.tiles : ListType.list);
}

enum ListType {
  list,
  tiles,
}
