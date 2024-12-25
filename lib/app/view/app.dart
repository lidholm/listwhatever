import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/app/view/app_router.dart';
import 'package:listwhatever/auth/auth_repository.dart';
import 'package:listwhatever/auth/bloc/auth_bloc.dart';
import 'package:listwhatever/changeUserBloc/change_user_bloc_bloc.dart';
import 'package:listwhatever/pages/list/bloc/list_bloc.dart';
import 'package:listwhatever/pages/list/repository/list_item_repository.dart';
import 'package:listwhatever/pages/lists/bloc/lists_bloc.dart';
import 'package:listwhatever/pages/lists/repository/list_repository.dart';
import 'package:listwhatever/pages/lists/repository/user_list_repository.dart';

class App extends StatelessWidget {
  const App({
    required this.authRepository,
    required this.userListRepository,
    required this.listRepository,
    required this.listItemRepository,
    required super.key,
  });
  final AuthRepository authRepository;
  final UserListRepository userListRepository;
  final ListRepository listRepository;
  final ListItemRepository listItemRepository;

  @override
  Widget build(BuildContext context) {
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
              listItemRepository: listItemRepository,
            ),
          ),
        ],
        child: Builder(
          builder: (context) {
            return const AppRouter();
          },
        ),
      ),
    );
  }
}
