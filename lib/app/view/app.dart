import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/app/view/app_theme.dart';
import 'package:listwhatever/auth/auth_repository.dart';
import 'package:listwhatever/auth/bloc/auth_bloc.dart';
import 'package:listwhatever/l10n/l10n.dart';
import 'package:listwhatever/pages/lists/bloc/lists_bloc.dart';
import 'package:listwhatever/pages/lists/repository/user_list_repository.dart';
import 'package:listwhatever/routing/go_router_configuration.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepository();
    return FutureBuilder(
      future: authRepository.user.first,
      builder: (context, snapshot) {
        final user = snapshot.data;
        final userListRepository = UserListRepository(userId: user?.id);

        final theme = ListWhateverTheme(context);

        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider.value(value: authRepository),
            RepositoryProvider.value(value: userListRepository),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => AuthBloc(authRepository: authRepository),
              ),
              BlocProvider(
                create: (_) =>
                    ListsBloc(userListRepository: userListRepository),
              ),
            ],
            child: Builder(
              builder: (context) {
                return MaterialApp.router(
                  routerConfig: getGoRouterConfiguration(context),
                  theme: theme.getThemeData(),
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
