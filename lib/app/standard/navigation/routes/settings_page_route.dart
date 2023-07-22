import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/app/custom/pages/settings/settings_page.dart';

@immutable
class SettingsPageRoute extends GoRouteData {
  const SettingsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
  }
}
