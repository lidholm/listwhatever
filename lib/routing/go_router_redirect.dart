import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

FutureOr<String?> routerRedirect(BuildContext context, GoRouterState state) {
  if (state.matchedLocation == '/unknown') {
    return '/';
  }
  return null;
}
