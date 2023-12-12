import 'package:analytics_repository/analytics_repository.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/custom/firestore/listItems/list_item_events/list_item_bloc.dart';
import 'package:listanything/custom/firestore/listItems/list_items.dart';
import 'package:listanything/custom/firestore/listItems/list_items_page_view_cubit.dart';
import 'package:listanything/custom/firestore/listItems/list_items_sort_order_cubit.dart';
import 'package:listanything/custom/firestore/lists/lists.dart';
import 'package:listanything/custom/navigation/get_router_provider_information.dart';
import 'package:listanything/custom/navigation/routes.dart';
import 'package:listanything/custom/pages/listItems/filters/filter_bloc.dart';
import 'package:listanything/custom/pages/listItems/filters/filter_view.dart';
import 'package:listanything/custom/pages/listItems/searchLocation/search_location_bloc.dart';
import 'package:listanything/l10n/l10n.dart';
import 'package:listanything/standard/analytics/analytics.dart';
import 'package:listanything/standard/app/app.dart';
import 'package:listanything/standard/app/widgets/delete_item_redirect_listener.dart';
import 'package:listanything/standard/navigation/redirect_cubit.dart';
import 'package:listanything/standard/navigation/router.dart';
import 'package:listanything/standard/theme_selector/theme_selector.dart';
import 'package:user_repository/user_repository.dart';

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
    const String? initialUser = null;
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
              BlocProvider<SearchLocationBloc>(create: (context) => SearchLocationBloc()),
              BlocProvider<FilterBloc>(create: (context) => FilterBloc()),
              BlocProvider<ListBloc>(create: (context) => ListBloc(ListsService(userId: initialUser))),
              BlocProvider<ListsBloc>(create: (context) => ListsBloc(ListsService(userId: initialUser))),
              BlocProvider<ListItemBloc>(create: (context) => ListItemBloc(ListItemsService(userId: initialUser))),
              BlocProvider<ListItemsBloc>(create: (context) => ListItemsBloc(ListItemsService(userId: initialUser))),
              BlocProvider<ListItemsPageViewCubit>(create: (context) => ListItemsPageViewCubit()),
              BlocProvider<ListItemsSortOrderCubit>(create: (context) => ListItemsSortOrderCubit()),
              BlocProvider<SelectedChipsCubit>(create: (context) => SelectedChipsCubit()),
              BlocProvider<RedirectCubit>(create: (context) => RedirectCubit()),
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
                child: child,
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
