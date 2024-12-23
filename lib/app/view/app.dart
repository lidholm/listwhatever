import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/app/view/app_theme.dart';
import 'package:listwhatever/auth/auth_repository.dart';
import 'package:listwhatever/auth/authenticated_user_listener.dart';
import 'package:listwhatever/auth/bloc/auth_bloc.dart';
import 'package:listwhatever/changeUserBloc/change_user_bloc_bloc.dart';
import 'package:listwhatever/l10n/l10n.dart';
import 'package:listwhatever/pages/list/bloc/list_bloc.dart';
import 'package:listwhatever/pages/lists/bloc/lists_bloc.dart';
import 'package:listwhatever/pages/lists/repository/list_repository.dart';
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
        final listRepository = ListRepository();
        final userListRepository = UserListRepository(userId: user?.id);

        final theme = ListWhateverTheme(context);

        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider.value(value: authRepository),
            RepositoryProvider.value(value: listRepository),
            RepositoryProvider.value(value: userListRepository),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                    ChangeUserBloc(userListRepository: userListRepository),
              ),
              BlocProvider(
                create: (_) => AuthBloc(authRepository: authRepository),
              ),
              BlocProvider(
                create: (_) => ListsBloc(
                  listRepository: listRepository,
                  userListRepository: userListRepository,
                ),
              ),
              BlocProvider(
                create: (_) => ListBloc(
                  listRepository: listRepository,
                  userListRepository: userListRepository,
                ),
              ),
            ],
            child: Builder(
              builder: (context) {
                return AuthenticatedUserListener(
                  child: MaterialApp.router(
                    routerConfig: getGoRouterConfiguration(context),
                    theme: theme.getThemeData(),
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
