import 'package:listwhatever/pages/list/models/list_item.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';

sealed class ListState {}

class ListInitial extends ListState {}

class ListLoading extends ListState {}

class ListLoaded extends ListState {
  ListLoaded({required this.list, required this.listItems});
  final ListOfThings list;
  final List<ListItem> listItems;
}
