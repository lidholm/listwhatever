import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/auth/bloc/auth_bloc.dart';
import 'package:listwhatever/changeUserBloc/change_user_bloc_bloc.dart';

class AuthenticatedUserListener extends StatelessWidget {
  const AuthenticatedUserListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
// call firestore to try and get the user data
// if it exists, then just fill the user object
// if it doesn't exists, set a OnboardingRequired thing

        final userId = switch (state) {
          AuthInitial() => null,
          AuthLoggedInWithData(:final user) => user.uid,
          AuthOnboardingRequired(:final user) => user.id,
          AuthLoggedIn(:final user) => user.id,
          AuthLoggedOut() => null,
        };

        context.read<ChangeUserBloc>().add(ChangeUserEvent(userId));

        switch (state) {
          case AuthInitial():
            break;

          case AuthLoggedIn():
            break;
          case AuthLoggedInWithData():
          // context
          //     .read<AnalyticsBloc>()
          //     .add(TrackAnalyticsEvent(LoginEvent()));
          case AuthOnboardingRequired():
          // context
          //     .read<AnalyticsBloc>()
          //     .add(TrackAnalyticsEvent(RequireOnboardingEvent()));
          case AuthLoggedOut():
          // context
          //     .read<AnalyticsBloc>()
          //     .add(TrackAnalyticsEvent(LogoutEvent()));
        }
      },
      listenWhen: differentStateOrUser,
      child: child,
    );
  }

  bool differentStateOrUser(AuthState previous, AuthState current) {
    if (previous != current) {
      return true;
    }

    if (previous is AuthLoggedInWithData && current is AuthLoggedInWithData) {
      if (previous.user != current.user) {
        return true;
      }
    }
    return false;
  }
}
