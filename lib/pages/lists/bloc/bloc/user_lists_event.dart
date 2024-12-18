part of 'user_lists_bloc.dart';

@freezed
class UserListsEvent with _$UserListsEvent {
  const factory UserListsEvent.watchUserLists() = _WatchUserLists;
}
