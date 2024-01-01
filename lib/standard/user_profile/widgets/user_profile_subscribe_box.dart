import 'package:flutter/material.dart';
import 'package:allmylists/l10n/l10n.dart';
import 'package:allmylists/standard/appUi/colors/app_colors.dart';
import 'package:allmylists/standard/appUi/spacing/app_spacing.dart';
import 'package:allmylists/standard/appUi/typography/app_font_weight.dart';
import 'package:allmylists/standard/appUi/widgets/app_button.dart';

class UserProfileSubscribeBox extends StatelessWidget {
  const UserProfileSubscribeBox({required this.onSubscribePressed, super.key});

  final VoidCallback onSubscribePressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xlg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.sm),
          Text(
            l10n.userProfileSubscribeBoxSubtitle,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: AppFontWeight.medium,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            l10n.userProfileSubscribeBoxMessage,
            style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.mediumEmphasisSurface),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton.smallRedWine(
            key: const Key('userProfileSubscribeBox_appButton'),
            onPressed: onSubscribePressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(l10n.userProfileSubscribeNowButtonText),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}
