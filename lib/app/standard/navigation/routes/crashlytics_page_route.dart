import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/app/standard/pages/crashlytics/crashlytics_page.dart';

@immutable
class CrashlyticstPageRoute extends GoRouteData {
  const CrashlyticstPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CrashlyticsPage();
  }
}
