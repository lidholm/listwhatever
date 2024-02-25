part of 'change_user_bloc_bloc.dart';

@freezed
class ChangeUserBlocEvent with _$ChangeUserBlocEvent {
  const factory ChangeUserBlocEvent.started() = _Started;
}