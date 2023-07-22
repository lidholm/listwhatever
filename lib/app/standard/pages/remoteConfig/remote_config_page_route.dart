import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/app/standard/pages/remoteConfig/remote_config_page.dart';

@immutable
class RemoteConfigPageRoute extends GoRouteData {
  const RemoteConfigPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RemoteConfigPage();
  }
}
