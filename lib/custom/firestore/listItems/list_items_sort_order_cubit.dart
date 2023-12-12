
import 'package:flutter_bloc/flutter_bloc.dart';

enum ListItemsSortOrder {
  name,
  date,
  distance,
}
enum SortOrder {
  ascending, descending
}

class ListItemsSortOrderCubit extends Cubit<(ListItemsSortOrder, SortOrder)> {
  ListItemsSortOrderCubit() : super((ListItemsSortOrder.name, SortOrder.ascending));

  void select(ListItemsSortOrder type) {
    final currentType = state.$1;
    if (type == currentType) {
      final order = state.$2 == SortOrder.ascending ? SortOrder.descending : SortOrder.ascending;
      emit((type, order));
    } else {
      emit((type, SortOrder.ascending));
    }
  }
}
