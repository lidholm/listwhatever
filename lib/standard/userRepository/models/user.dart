import 'package:freezed_annotation/freezed_annotation.dart';
import '/standard/authenticationClient/models/authentication_user.dart';
import '/standard/settings/settings.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    required String photo,
    required bool isNewUser,
    required Settings settings,
    required bool hasLoadedFromFirestore,
    required bool anonymous,
  }) = _User;

  // Added constructor. Must not have any parameter
  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  bool isAnonymous() {
    return anonymous || id == '';
  }
}

User fromAuthenticationUser(AuthenticationUser authenticationUser) {
  return User(
    email: authenticationUser.email ?? '',
    id: authenticationUser.id,
    name: authenticationUser.name ?? '',
    photo: authenticationUser.photo ?? '',
    isNewUser: authenticationUser.isNewUser,
    settings: defaultSettings,
    hasLoadedFromFirestore: false,
    anonymous: authenticationUser.isAnonymous,
  );
}

const anonymousUser = User(
  email: '',
  id: '',
  name: '',
  photo: '',
  isNewUser: false,
  settings: defaultSettings,
  hasLoadedFromFirestore: true,
  anonymous: true,
);
