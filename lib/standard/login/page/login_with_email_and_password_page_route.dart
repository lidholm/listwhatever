import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/standard/login/login.dart';

@immutable
class LoginWithEmailAndPasswordPageRoute extends GoRouteData {
  const LoginWithEmailAndPasswordPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginWithEmailAndPasswordPage();
  }
}
