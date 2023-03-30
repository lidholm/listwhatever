import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_user.freezed.dart';

@freezed
class SelectedUser with _$SelectedUser {
  factory SelectedUser({
    required String uid,
    String? email,
    String? name,
  }) = _SelectedUser;
}
