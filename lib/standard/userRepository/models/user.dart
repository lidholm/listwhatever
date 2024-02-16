import 'package:listwhatever/standard/settings/settings.dart';

import '/standard/authenticationClient/models/authentication_user.dart';

/// {@template user}
/// User model represents the current user with subscription plan.
/// {@endtemplate}
class User extends AuthenticationUser {
  /// {@macro user}
  const User({
    required super.id,
    super.email,
    super.name,
    super.photo,
    super.isNewUser,
    this.settings,
    this.hasLoadedFromFirestore = false,
  });

  /// Converts [AuthenticationUser] to [User].
  factory User.fromAuthenticationUser({
    required AuthenticationUser authenticationUser,
  }) =>
      User(
        email: authenticationUser.email,
        id: authenticationUser.id,
        name: authenticationUser.name,
        photo: authenticationUser.photo,
        isNewUser: authenticationUser.isNewUser,
      );

  final Settings? settings;
  final bool hasLoadedFromFirestore;

  /// Whether the current user is anonymous.
  @override
  bool get isAnonymous => this == anonymous;

  /// Anonymous user which represents an unauthenticated user.
  static const User anonymous = User(
    id: '',
  );
}
