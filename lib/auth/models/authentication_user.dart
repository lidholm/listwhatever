import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_user.freezed.dart';
part 'authentication_user.g.dart';

const anonymousId = '-1';

@freezed
class AuthenticationUser with _$AuthenticationUser {
  factory AuthenticationUser({
    required String id,
    required String? email,
    required String? name,
    required String? photo,
    required bool isNewUser,
  }) = _AuthenticationUser;

  // Added constructor. Must not have any parameter
  // ignore: unused_element
  const AuthenticationUser._();

  factory AuthenticationUser.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationUserFromJson(json);

  factory AuthenticationUser.anonymous() => AuthenticationUser(
        id: anonymousId,
        email: 'anonymous',
        name: '',
        photo: '',
        isNewUser: false,
      );

  bool isAnonymous() {
    return id == anonymousId;
  }
}
