import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/app/standard/pages/about/about_page.dart';

@immutable
class AboutPageRoute extends GoRouteData {
  const AboutPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AboutPage();
  }
}
