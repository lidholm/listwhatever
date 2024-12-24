import 'package:listwhatever/pages/list/models/list_item.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';

sealed class ListEvent {}

class GetList extends ListEvent {
  GetList(this.listId);
  final String listId;
}

class AddList extends ListEvent {
  AddList(this.list);
  final ListOfThings list;
}

class AddListItem extends ListEvent {
  AddListItem(this.listId, this.listItem);
  final String listId;
  final ListItem listItem;
}
