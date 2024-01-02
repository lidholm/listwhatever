import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import '/custom/navigation/routes.dart';
import '/custom/pages/about/about_page_route.dart';
import '/custom/pages/crashlytics/crashlytics.dart';
import '/custom/pages/deleteAccount/delete_account_page_route.dart';
import '/custom/pages/firebase_performance/firebase_performance.dart';
import '/custom/pages/lists/lists.dart';
import '/custom/pages/maps/maps_page_route.dart';
import '/custom/pages/privacyPolicy/privacy_policy_page_route.dart';
import '/custom/pages/remoteConfig/remote_config_page_route.dart';
import '/l10n/l10n.dart';
import '/standard/appUi/colors/app_colors.dart';
import '/standard/appUi/spacing/app_spacing.dart';

import '../models/link.dart';

class NavDrawerSections extends StatelessWidget {
  const NavDrawerSections({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = {
      context.l10n.functionalitySectionHeader: [
        Link('maps', 'Maps', () => const MapsPageRoute().push<void>(context)),
        Link('lists', 'Lists', () => const ListsPageRoute().push<void>(context)),
      ],
      context.l10n.firebaseSectionHeader: [
        Link('remoteConfig', 'Remote Config', () => const RemoteConfigPageRoute().push<void>(context)),
        Link('crashlytics', 'Crashlytics', () => const CrashlyticstPageRoute().push<void>(context)),
        Link(
          'firebaseperformance',
          'Firebase Performance',
          () => const FirebasePerformancePageRoute().push<void>(context),
        ),
      ],
      context.l10n.aboutSectionHeader: [
        Link('about', 'About', () => const AboutPageRoute().push<void>(context)),
        Link('deleteaccount', 'Delete Account', () => const DeleteAccountPageRoute().push<void>(context)),
        Link('privacypolicy', 'Privacy Policy', () => const PrivacyPolicyPageRoute().push<void>(context)),
      ],
    };

    return Column(
      children: [
        for (final section in sections.entries) ...[
          NavDrawerSectionsTitle(title: section.key),
          for (final link in section.value)
            NavDrawerSectionItem(
              key: ValueKey(link.key),
              title: toBeginningOfSentenceCase(link.title) ?? '',
              onTap: link.callback,
            ),
        ],
      ],
    );
  }
}

@visibleForTesting
class NavDrawerSectionsTitle extends StatelessWidget {
  const NavDrawerSectionsTitle({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg + AppSpacing.xxs,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.primaryContainer,
              ),
        ),
      ),
    );
  }
}

@visibleForTesting
class NavDrawerSectionItem extends StatelessWidget {
  const NavDrawerSectionItem({
    required this.title,
    this.onTap,
    this.leading,
    this.selected = false,
    super.key,
  });

  static const _borderRadius = 100.0;

  final String title;
  final Widget? leading;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
      child: ListTile(
        dense: true,
        leading: leading,
        visualDensity: const VisualDensity(
          vertical: VisualDensity.minimumDensity,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: selected ? AppSpacing.xlg : AppSpacing.lg,
          vertical: AppSpacing.lg + AppSpacing.xxs,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(_borderRadius),
          ),
        ),
        horizontalTitleGap: AppSpacing.md,
        minLeadingWidth: AppSpacing.xlg,
        selectedTileColor: AppColors.white.withOpacity(0.08),
        selected: selected,
        onTap: onTap,
        title: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: selected ? AppColors.highEmphasisPrimary : AppColors.mediumEmphasisPrimary,
              ),
        ),
      ),
    );
  }
}
