import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'onboarding_page.dart';

@immutable
class OnboardingPageRoute extends GoRouteData {
  const OnboardingPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OnboardingPage();
  }
}
