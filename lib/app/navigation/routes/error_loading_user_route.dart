import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class ErrorLoadingUserRoute extends GoRouteData {
  const ErrorLoadingUserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Text('Error loading user');
  }
}
