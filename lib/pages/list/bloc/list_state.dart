part of 'list_bloc.dart';

@freezed
class ListState with _$ListState {
  const factory ListState.initial() = _Initial;
  const factory ListState.loading() = _Loading;
  const factory ListState.loaded(ListOfThings list) = _Loaded;
}
