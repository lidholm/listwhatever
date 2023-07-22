import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/app/standard/pages/sign_up_user/sign_up_user_page.dart';

@immutable
class SignUpUserPageRoute extends GoRouteData {
  const SignUpUserPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpUserPage();
  }
}
