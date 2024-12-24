import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/pages/auth/pages/log_in_options_page.dart';

@immutable
class LoginPageRoute extends GoRouteData {
  const LoginPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LogInOptionsPage();
  }
}
