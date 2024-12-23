part of 'lists_bloc.dart';

@freezed
class ListsEvent with _$ListsEvent {
  const factory ListsEvent.watchUserLists() = _WatchUserLists;
}
