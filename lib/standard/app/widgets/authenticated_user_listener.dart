import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/standard/app/bloc/app_bloc.dart';
import 'package:listwhatever/standard/changeUserBloc/bloc/change_user_bloc_bloc.dart';

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
// call firestore to try and get the user data
// if it exists, then just fill the user object
// if it doesn't exists, set a OnboardingRequired thing

        final user = switch (state) {
          LoggedIn(:final user) => user,
          LoggedInWithData(:final user) => user,
          OnboardingRequired() => null,
          LoggedOut() => null,
        };

        // logger
        //   ..i('$this => in AuthenticatedUserListener QQQQ3')
        //   ..i('$this => state $state QQQQ4')
        //   ..i('$this => calling ChangeUserBloc for ChangeUserEvent and user ${user.id} QQQQ4');

        context.read<ChangeUserBloc>().add(
              ChangeUserEvent(
                user,
              ),
            );

        switch (state) {
          case LoggedIn():
            break;
          case LoggedInWithData():
            context.read<AnalyticsBloc>().add(TrackAnalyticsEvent(LoginEvent()));
          case OnboardingRequired():
            context.read<AnalyticsBloc>().add(TrackAnalyticsEvent(RequireOnboardingEvent()));
          case LoggedOut():
            context.read<AnalyticsBloc>().add(TrackAnalyticsEvent(LogoutEvent()));
        }
      },
      listenWhen: differentStateOrUser,
      child: child,
    );
  }

  bool differentStateOrUser(AppState previous, AppState current) {
    if (previous != current) {
      return true;
    }

    if (previous is LoggedInWithData && current is LoggedInWithData) {
      if (previous.user != current.user) {
        return true;
      }
    }
    return false;
  }
}
