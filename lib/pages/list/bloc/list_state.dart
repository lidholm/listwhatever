import 'package:listwhatever/pages/lists/models/list_of_things.dart';

sealed class ListState {}

class ListInitial extends ListState {}

class ListLoading extends ListState {}

class ListLoaded extends ListState {
  ListLoaded(this.list);
  final ListOfThings list;
}
