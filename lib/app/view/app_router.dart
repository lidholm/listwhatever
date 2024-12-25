import 'package:flutter/material.dart';
import 'package:listwhatever/app/view/app_theme.dart';
import 'package:listwhatever/auth/authenticated_user_listener.dart';
import 'package:listwhatever/l10n/l10n.dart';
import 'package:listwhatever/routing/go_router_configuration.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ListWhateverTheme(context);

    return AuthenticatedUserListener(
      child: MaterialApp.router(
        routerConfig: getGoRouterConfiguration(context),
        theme: theme.getThemeData(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
