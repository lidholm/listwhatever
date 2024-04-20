import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/standard/app/bloc/app_bloc.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/user_profile/bloc/user_profile_bloc.dart';

import '/l10n/l10n.dart';
import '/standard/analytics/bloc/analytics_bloc.dart';
import '/standard/analytics/bloc/analytics_event.dart';
import '/standard/analyticsRepository/models/ntg_event.dart';
import '/standard/app/bloc/app_event.dart';
import '/standard/app/bloc/app_state.dart';
import '/standard/appUi/colors/app_colors.dart';
import '/standard/appUi/generated/assets.gen.dart';
import '/standard/appUi/spacing/app_spacing.dart';
import '/standard/appUi/widgets/app_button.dart';
import '/standard/appUi/widgets/app_dropdown.dart';
import '/standard/settings/settings.dart';
import '/standard/userRepository/user_repository.dart';
import '/standard/user_profile/bloc/user_profile_event.dart';
import '/standard/user_profile/bloc/user_profile_state.dart';
import '/standard/widgets/appBar/common_app_bar.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  static MaterialPageRoute<void> route() {
    return MaterialPageRoute(builder: (_) => const UserProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserProfileBloc(
        userRepository: context.read<UserRepository>(),
      ),
      child: const UserProfileView(),
    );
  }
}

@visibleForTesting
class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    context.read<UserProfileBloc>().add(const FetchNotificationsEnabled());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Fetch current notification status each time a user enters the app.
    // This may happen when a user changes permissions in app settings.
    if (state == AppLifecycleState.resumed) {
      WidgetsFlutterBinding.ensureInitialized();
      context.read<UserProfileBloc>().add(const FetchNotificationsEnabled());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appState = context.watch<AppBloc>().state;
    if (appState is! LoggedInWithData) {
      return const Text('Not logged in and onboarded');
    }
    final user = appState.user;

    return BlocListener<UserProfileBloc, UserProfileState>(
      listener: (context, state) {
        if (state.status == UserProfileStatus.togglingNotificationsSucceeded && state.notificationsEnabled) {
          context.read<AnalyticsBloc>().add(TrackAnalyticsEvent(PushNotificationSubscriptionEvent()));
        }
      },
      child: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          logger.i('$this -> popping once');
          GoRouter.of(context).pop();
        },
        child: Scaffold(
          appBar: const CommonAppBar(
            title: '',
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const UserProfileTitle(),
                    if (!user.isAnonymous()) ...[
                      UserProfileItem(
                        key: const Key('userProfilePage_userItem'),
                        leading: Assets.icons.profileIcon.svg(),
                        title: user.email,
                      ),
                      const UserProfileLogoutButton(),
                    ],
                    const SizedBox(height: AppSpacing.lg),
                    const _UserProfileDivider(),
                    UserProfileSubtitle(
                      subtitle: l10n.userProfileSettingsSubtitle,
                    ),
                    UserProfileItem(
                      key: const Key('userProfilePage_distanceUnitItem'),
                      leading: const Icon(Icons.display_settings_outlined),
                      title: l10n.userProfileSettingsDistanceUnitTitle,
                      trailing: AppDropdown<DistanceUnitOptions>(
                        selectedValue: user.settings.distanceUnit,
                        values: {
                          for (final v in DistanceUnitOptions.values)
                            v: l10n.userProfileSettingsDistanceUnitType(v.toString()),
                        },
                        onChanged: (distanceUnit) {
                          if (distanceUnit != null) {
                            // final updatedSettings = user.settings.copyWith(
                            //   distanceUnit: distanceUnit,
                            // );
                            // context.read<AppBloc>().add(UpdateSettings(user, updatedSettings));
                          }
                        },
                      ),
                    ),
                    const _UserProfileDivider(),
                    UserProfileSubtitle(
                      subtitle: l10n.userProfileLegalSubtitle,
                    ),
                    UserProfileItem(
                      key: const Key('userProfilePage_termsOfServiceItem'),
                      leading: Assets.icons.termsOfUseIcon.svg(),
                      title: l10n.userProfileLegalTermsOfUseAndPrivacyPolicyTitle,
                      onTap: () {},
                    ),
                    UserProfileItem(
                      key: const Key('userProfilePage_aboutItem'),
                      leading: Assets.icons.aboutIcon.svg(),
                      title: l10n.userProfileLegalAboutTitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@visibleForTesting
class UserProfileTitle extends StatelessWidget {
  const UserProfileTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Text(
        context.l10n.userProfileTitle,
        style: theme.textTheme.displaySmall,
      ),
    );
  }
}

@visibleForTesting
class UserProfileSubtitle extends StatelessWidget {
  const UserProfileSubtitle({required this.subtitle, super.key});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.sm,
        AppSpacing.lg,
        AppSpacing.md,
      ),
      child: Text(
        subtitle,
        style: theme.textTheme.titleSmall,
      ),
    );
  }
}

@visibleForTesting
class UserProfileItem extends StatelessWidget {
  const UserProfileItem({
    required this.title,
    this.leading,
    this.trailing,
    this.onTap,
    super.key,
  });

  static const _leadingWidth = AppSpacing.xxxlg + AppSpacing.sm;

  final String title;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final hasLeading = leading != null;

    return ListTile(
      dense: true,
      leading: SizedBox(
        width: hasLeading ? _leadingWidth : 0,
        child: leading,
      ),
      trailing: trailing,
      visualDensity: const VisualDensity(
        vertical: VisualDensity.minimumDensity,
      ),
      contentPadding: EdgeInsets.fromLTRB(
        hasLeading ? 0 : AppSpacing.xlg,
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
      ),
      horizontalTitleGap: 0,
      minLeadingWidth: hasLeading ? _leadingWidth : 0,
      onTap: onTap,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.highEmphasisSurface,
            ),
      ),
    );
  }
}

@visibleForTesting
class UserProfileLogoutButton extends StatelessWidget {
  const UserProfileLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xxlg + AppSpacing.lg,
      ),
      child: AppButton.smallDarkAqua(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.logOutIcon.svg(),
            const SizedBox(width: AppSpacing.sm),
            Text(context.l10n.userProfileLogoutButtonText),
          ],
        ),
        onPressed: () => context.read<AppBloc>().add(const AppLogoutRequested()),
      ),
    );
  }
}

class _UserProfileDivider extends StatelessWidget {
  const _UserProfileDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Divider(
        color: AppColors.borderOutline,
        indent: 0,
        endIndent: 0,
      ),
    );
  }
}
