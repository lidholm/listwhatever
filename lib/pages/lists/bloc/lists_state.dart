part of 'lists_bloc.dart';

@freezed
class ListsState with _$ListsState {
  const factory ListsState.initial() = ListsInitial;
  const factory ListsState.loading() = ListsLoading;
  const factory ListsState.loaded(List<UserList> lists) = ListsLoaded;
}
