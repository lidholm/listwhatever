import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/standard/user_profile/view/user_profile_page.dart';

@immutable
class UserProfilePageRoute extends GoRouteData {
  const UserProfilePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UserProfilePage();
  }
}
