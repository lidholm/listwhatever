import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/app/standard/pages/privacyPolicy/privacy_policy_page.dart';

@immutable
class PrivacyPolicyPageRoute extends GoRouteData {
  const PrivacyPolicyPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PrivacyPolicyPage();
  }
}
