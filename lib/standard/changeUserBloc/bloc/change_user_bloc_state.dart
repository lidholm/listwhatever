part of 'change_user_bloc_bloc.dart';

sealed class ChangeUserState {}

class UserLoaded extends ChangeUserState {
  UserLoaded(this.user);
  final User? user;
}
