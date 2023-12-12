import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/standard/user_profile/user_profile.dart';

@immutable
class UserProfilePageRoute extends GoRouteData {
  const UserProfilePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UserProfilePage();
  }
}
