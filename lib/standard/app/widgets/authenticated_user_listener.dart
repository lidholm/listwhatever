import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/custom/firestore/listItems/list_item_events/list_item_bloc.dart';
import '/custom/firestore/listItems/list_item_events/list_item_event.dart';
import '/custom/firestore/listItems/list_items.dart';
import '/custom/firestore/lists/lists.dart';
import '/standard/analytics/bloc/analytics_bloc.dart';
import '/standard/analytics/bloc/analytics_event.dart';
import '/standard/analyticsRepository/models/ntg_event.dart';
import '/standard/app/app.dart';
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
        context.read<ListBloc>().add(
              ChangeUserForList(
                state.user.id,
              ),
            );
        context.read<ListsBloc>().add(
              ChangeUserForLists(
                state.user.id,
              ),
            );
        context.read<ListItemsBloc>().add(
              ChangeUserForListItems(
                state.user.id,
              ),
            );
        context.read<ListItemBloc>().add(
          ChangeUserForListItem(
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
