import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:allmylists/standard/view/login_with_email_and_password_page.dart';

@immutable
class LoginWithEmailAndPasswordPageRoute extends GoRouteData {
  const LoginWithEmailAndPasswordPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginWithEmailAndPasswordPage();
  }
}
