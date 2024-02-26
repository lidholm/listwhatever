import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/standard/app/bloc/app_bloc.dart';
import 'package:listwhatever/standard/changeUserBloc/bloc/change_user_bloc_bloc.dart';
import 'package:listwhatever/standard/constants.dart';

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
        logger.i('$this => calling ChangeUserBlocBloc for ChangeUserEvent and user ${state.user} QQQ');
        context.read<ChangeUserBlocBloc>().add(
              ChangeUserEvent(
                state.user,
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
