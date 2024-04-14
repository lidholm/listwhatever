import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/standard/app/bloc/app_bloc.dart';
import 'package:listwhatever/standard/app/bloc/app_state.dart';
import 'package:listwhatever/standard/page/login_page_route.dart';
import 'package:listwhatever/standard/user_profile/page/user_profile_page_route.dart';
import '/custom/navigation/routes.dart';
import '/l10n/l10n.dart';
import '/standard/appUi/generated/assets.gen.dart';
import '/standard/appUi/spacing/app_spacing.dart';
import '/standard/appUi/widgets/show_app_modal.dart';
import '/standard/view/login_modal.dart';

/// A user profile button which displays a [LoginButton]
/// for the unauthenticated user or an [OpenProfileButton]
/// for the authenticated user.
class UserProfileButton extends StatelessWidget {
  const UserProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.select<AppBloc, bool>(
      (bloc) => bloc.state is LoggedInWithData,
    );

    return isLoggedIn ? const OpenProfileButton() : const LoginButton();
  }
}

@visibleForTesting
class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Assets.icons.logInIcon.svg(),
      iconSize: 24,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      onPressed: () {
        context.go(const LoginPageRoute().location);
      },
      tooltip: context.l10n.loginTooltip,
    );
  }
}

@visibleForTesting
class OpenProfileButton extends StatelessWidget {
  const OpenProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Assets.icons.profileIcon.svg(),
      iconSize: 24,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      onPressed: () => const UserProfilePageRoute().push<void>(context),
      tooltip: context.l10n.openProfileTooltip,
    );
  }
}
