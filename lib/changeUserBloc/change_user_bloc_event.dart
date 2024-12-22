part of 'change_user_bloc_bloc.dart';

abstract class BaseChangeUserEvent {}

class ChangeUserEvent extends BaseChangeUserEvent {
  ChangeUserEvent(this.userId);
  final String? userId;
}
