import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/standard/app/widgets/to_onscreen_logs_listener.dart';
import 'package:listwhatever/standard/onScreenLog/on_screen_log_cubit.dart';
import '/custom/firestore/listItems/list_item_events/list_item_bloc.dart';
import '/custom/firestore/listItems/list_items.dart';
import '/custom/firestore/listItems/list_items_page_view_cubit.dart';
import '/custom/firestore/listItems/list_items_sort_order_cubit.dart';
import '/custom/firestore/lists/lists.dart';
import '/custom/firestore/lists/user_lists_service.dart';
import '/custom/firestore/sharedList/bloc/shared_list_bloc.dart';
import '/custom/firestore/sharedList/shared_lists_service.dart';
import '/custom/navigation/get_router_provider_information.dart';
import '/custom/navigation/routes.dart';
import '/custom/pages/listItems/filters/filter_bloc.dart';
import '/custom/pages/listItems/filters/filter_view.dart';
import '/custom/pages/listItems/searchLocation/search_location_bloc.dart';
import '/custom/pages/subscribeList/bloc/subscribe_list_bloc.dart';
import '/l10n/l10n.dart';
import '/standard/analytics/bloc/analytics_bloc.dart';
import '/standard/analyticsRepository/analytics_repository.dart';
import '/standard/app/app.dart';
import '/standard/app/bloc/app_event.dart';
import '/standard/app/widgets/delete_item_redirect_listener.dart';
import '/standard/appUi/theme/app_theme.dart';
import '/standard/bloc/login_bloc.dart';
import '/standard/constants.dart';
import '/standard/navigation/redirect_cubit.dart';
import '/standard/navigation/router.dart';
import '/standard/theme_selector/theme_selector.dart';
import '/standard/userRepository/models/user.dart';
import '/standard/userRepository/user_repository.dart';

class App extends StatelessWidget {
  const App({
    required UserRepository userRepository,
    required AnalyticsRepository analyticsRepository,
    required User user,
    this.observers,
    super.key,
  })  : _userRepository = userRepository,
        _analyticsRepository = analyticsRepository,
        _user = user;

  final UserRepository _userRepository;
  final AnalyticsRepository _analyticsRepository;
  final User _user;
  final List<NavigatorObserver>? observers;

  @override
  Widget build(BuildContext context) {
    logger.d('starting app');
    const String? initialUser = null;

    final sharedListsService = SharedListsService();
    final userListsService = UserListsService(userId: initialUser);
    final listsService = ListsService(userId: initialUser);
    final listItemsService = ListItemsService(userId: initialUser);

    Widget blocAndProviders(Widget child) => MultiRepositoryProvider(
          providers: [
            RepositoryProvider.value(value: _userRepository),
            RepositoryProvider.value(value: _analyticsRepository),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => AppBloc(
                  userRepository: _userRepository,
                  user: _user,
                )..add(const AppOpened()),
              ),
              BlocProvider(create: (_) => ThemeModeBloc()),
              BlocProvider<OnScreenLogsCubit>(create: (context) => OnScreenLogsCubit()),
              BlocProvider<SearchLocationBloc>(create: (context) => SearchLocationBloc()),
              BlocProvider<FilterBloc>(create: (context) => FilterBloc()),
              BlocProvider<SharedListBloc>(create: (context) => SharedListBloc(sharedListsService)),
              BlocProvider<ListBloc>(create: (context) => ListBloc(userListsService, listsService)),
              BlocProvider<ListsBloc>(create: (context) => ListsBloc(listsService, userListsService)),
              BlocProvider<ListItemBloc>(create: (context) => ListItemBloc(listItemsService)),
              BlocProvider<SubscribeListBloc>(create: (context) => SubscribeListBloc(sharedListsService, listsService)),
              BlocProvider<ListItemsBloc>(create: (context) => ListItemsBloc(userListsService, listItemsService)),
              BlocProvider<ListItemsPageViewCubit>(create: (context) => ListItemsPageViewCubit()),
              BlocProvider<ListItemsSortOrderCubit>(create: (context) => ListItemsSortOrderCubit()),
              BlocProvider<SelectedChipsCubit>(create: (context) => SelectedChipsCubit()),
              BlocProvider<RedirectCubit>(create: (context) => RedirectCubit()),
              BlocProvider<LoginBloc>(
                create: (context) => LoginBloc(
                  userRepository: context.read<UserRepository>(),
                ),
              ),
              BlocProvider(
                create: (context) => AnalyticsBloc(
                  analyticsRepository: _analyticsRepository,
                  userRepository: _userRepository,
                ),
                lazy: false,
              ),
            ],
            child: AuthenticatedUserListener(
              child: DeleteItemRedirectListener(
                child: ToOnScreenLogsListener(
                  child: child,
                ),
              ),
            ),
          ),
        );
    final routerProviderInformation = getRouterProviderInformation();
    return blocAndProviders(
      Builder(
        builder: (context) {
          final router = getRouter(
            context: context,
            routes: $appRoutes,
            routerProviderInformation: routerProviderInformation,
            observers: observers,
          );
          return AppView(router);
        },
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView(this.router, {super.key});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.light,
      theme: const AppTheme().themeData,
      darkTheme: const AppDarkTheme().themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }
}
