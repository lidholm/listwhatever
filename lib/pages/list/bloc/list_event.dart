part of 'list_bloc.dart';

@freezed
class ListEvent with _$ListEvent {
  const factory ListEvent.getList(String listId) = _GetList;
  const factory ListEvent.addList(ListOfThings list) = _AddList;
}
