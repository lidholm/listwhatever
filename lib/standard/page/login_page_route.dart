import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/standard/page/login_page.dart';

@immutable
class LoginPageRoute extends GoRouteData {
  const LoginPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}
