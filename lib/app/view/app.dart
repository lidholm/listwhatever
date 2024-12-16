import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/auth/auth_repository.dart';
import 'package:listwhatever/auth/bloc/auth_bloc.dart';
import 'package:listwhatever/l10n/l10n.dart';
import 'package:listwhatever/pages/firestore/bloc/pet_bloc.dart';
import 'package:listwhatever/pages/firestore/repository/pet_repository.dart';
import 'package:listwhatever/routing/go_router_configuration.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final petRepository = PetRepository();
    final authRepository = AuthRepository();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: petRepository),
        RepositoryProvider.value(value: authRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PetBloc(petRepository: petRepository)),
          BlocProvider(create: (_) => AuthBloc(authRepository: authRepository)),
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              routerConfig: getGoRouterConfiguration(context),
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                ),
                useMaterial3: true,
              ),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            );
          },
        ),
      ),
    );
  }
}
