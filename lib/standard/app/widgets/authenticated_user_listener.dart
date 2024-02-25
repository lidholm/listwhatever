import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/standard/app/bloc/app_bloc.dart';

import '/custom/pages/listItems/list_item_crud_bloc/list_item_crud_bloc.dart';
import '/custom/pages/listItems/list_item_crud_bloc/list_item_crud_event.dart';
import '/custom/pages/listItems/list_item_load_bloc/list_item_load_bloc.dart';
import '/custom/pages/listItems/list_item_load_bloc/list_item_load_event.dart';
import '/custom/pages/listItems/list_items_load_bloc/list_items_load_bloc.dart';
import '/custom/pages/listItems/list_items_load_bloc/list_items_load_event.dart';
import '/custom/pages/lists/list_load_events/list_load_bloc.dart';
import '/custom/pages/lists/list_load_events/list_load_event.dart';
import '/custom/pages/lists/lists_load_events/lists_bloc.dart';
import '/custom/pages/lists/lists_load_events/lists_event.dart';
import '/standard/analytics/bloc/analytics_bloc.dart';
import '/standard/analytics/bloc/analytics_event.dart';
import '/standard/analyticsRepository/models/ntg_event.dart';
import '/standard/app/bloc/app_state.dart';

class AuthenticatedUserListener extends StatelessWidget {
  const AuthenticatedUserListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        context.read<ListLoadBloc>().add(
              ChangeUserForListLoad(
                state.user.id,
              ),
            );
        context.read<ListsLoadBloc>().add(
              ChangeUserForListsLoad(
                state.user.id,
              ),
            );
        context.read<ListItemLoadBloc>().add(
              ChangeUserForListItemLoad(
                state.user.id,
              ),
            );
        context.read<ListItemsLoadBloc>().add(
              ChangeUserForListItemsLoad(
                state.user.id,
              ),
            );
        context.read<ListItemCrudBloc>().add(
              ChangeUserForListItemCrud(
                state.user.id,
              ),
            );

        if (state.status.isLoggedIn) {
          context.read<AnalyticsBloc>().add(
                TrackAnalyticsEvent(
                  state.user.isNewUser ? RegistrationEvent() : LoginEvent(),
                ),
              );
        }
      },
      listenWhen: (previous, current) => previous.status != current.status,
      child: child,
    );
  }
}
