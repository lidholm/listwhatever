import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listwhatever/standard/constants.dart';
import '/standard/authenticationClient/models/authentication_user.dart';
import '/standard/settings/settings.dart';

part 'user.freezed.dart';
part 'user.g.dart';

const anonymousId = 'anonymous';

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    required String photo,
    required Settings settings,
  }) = _User;

  // Added constructor. Must not have any parameter
  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  bool isAnonymous() {
    logger.i('in User.isAnonymous: id: $id');
    return id == anonymousId || id.isEmpty;
  }
}

User fromAuthenticationUser(AuthenticationUser authenticationUser) {
  return User(
    email: authenticationUser.email ?? '',
    id: authenticationUser.id,
    name: authenticationUser.name ?? '',
    photo: authenticationUser.photo ?? '',
    settings: defaultSettings,
  );
}

const anonymousUser = User(
  // TODO: Should be able to remove this !?
  email: '',
  id: anonymousId,
  name: '',
  photo: '',
  settings: defaultSettings,
);
