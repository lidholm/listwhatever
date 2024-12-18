import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/app/view/app_theme.dart';
import 'package:listwhatever/auth/auth_repository.dart';
import 'package:listwhatever/auth/bloc/auth_bloc.dart';
import 'package:listwhatever/l10n/l10n.dart';
import 'package:listwhatever/pages/lists/bloc/bloc/user_lists_bloc.dart';
import 'package:listwhatever/pages/lists/repository/user_list_repository.dart';
import 'package:listwhatever/pages/pets/bloc/pet_bloc.dart';
import 'package:listwhatever/pages/pets/repository/pet_repository.dart';
import 'package:listwhatever/routing/go_router_configuration.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepository();
    final petRepository = PetRepository();
    final userListRepository = UserListRepository(userId: null);

    final theme = ListWhateverTheme(context);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authRepository),
        RepositoryProvider.value(value: petRepository),
        RepositoryProvider.value(value: userListRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthBloc(authRepository: authRepository)),
          BlocProvider(create: (_) => PetBloc(petRepository: petRepository)),
          BlocProvider(
            create: (_) =>
                UserListsBloc(userListRepository: userListRepository),
          ),
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              routerConfig: getGoRouterConfiguration(context),
              theme: theme.getThemeData(),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            );
          },
        ),
      ),
    );
  }
}
