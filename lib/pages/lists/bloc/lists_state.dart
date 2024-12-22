part of 'lists_bloc.dart';

@freezed
class ListsState with _$ListsState {
  const factory ListsState.initial() = Initial;
  const factory ListsState.loading() = Loading;
  const factory ListsState.loaded(List<UserList> lists) = Loaded;
}
