
import 'package:flutter_bloc/flutter_bloc.dart';

enum ListItemsPageView {
  listView,
  mapsView,
}

class ListItemsPageViewCubit extends Cubit<ListItemsPageView> {
  ListItemsPageViewCubit() : super(ListItemsPageView.listView);

  void toggle() => emit(
    state == ListItemsPageView.listView
        ? ListItemsPageView.mapsView
        : ListItemsPageView.listView,
  );
}
