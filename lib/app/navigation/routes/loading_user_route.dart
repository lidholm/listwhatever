import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/navigation/loading_user_page.dart';

@immutable
class LoadingUserRoute extends GoRouteData {
  const LoadingUserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoadingUserPage();
  }
}
