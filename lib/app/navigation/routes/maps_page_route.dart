import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/maps_page.dart';

@immutable
class MapsPageRoute extends GoRouteData {
  const MapsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MapsPage();
  }
}
