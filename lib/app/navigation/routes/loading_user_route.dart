import 'package:flutter/material.dart';
import 'package:flutterbase/app/navigation/loading_user_page.dart';
import 'package:go_router/go_router.dart';

@immutable
class LoadingUserRoute extends GoRouteData {
  const LoadingUserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoadingUserPage();
  }
}
