import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'firebase_in_app_messaging.dart';

@immutable
class FirebaseInAppMessagingPageRoute extends GoRouteData {
  const FirebaseInAppMessagingPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FirebaseInAppMessagingPage();
  }
}
