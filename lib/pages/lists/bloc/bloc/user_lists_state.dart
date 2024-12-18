part of 'user_lists_bloc.dart';

@freezed
class UserListsState with _$UserListsState {
  const factory UserListsState.initial() = Initial;
  const factory UserListsState.loading() = Loading;
  const factory UserListsState.loaded(List<UserList> lists) = Loaded;
}
