import 'package:flutter_bloc/flutter_bloc.dart';

class ListTypeCubit extends Cubit<ListViewType> {
  ListTypeCubit() : super(ListViewType.list);

  void toggle() =>
      emit(state == ListViewType.list ? ListViewType.tiles : ListViewType.list);
}

enum ListViewType {
  list,
  tiles,
}
