import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/standard/appUi/colors/app_colors.dart';
import '/standard/appUi/spacing/app_spacing.dart';
import '/standard/appUi/typography/app_text_styles.dart';
import '/standard/appUi/widgets/app_button.dart';
import '/standard/widgets/appBar/common_app_bar.dart';

/// {@template network_error}
/// A network error alert.
/// {@endtemplate}
class NetworkError extends StatelessWidget {
  /// {@macro network_error}
  const NetworkError({super.key, this.onRetry});

  /// An optional callback which is invoked when the retry button is pressed.
  final VoidCallback? onRetry;

  /// Route constructor to display the widget inside a [Scaffold].
  static Route<void> route({VoidCallback? onRetry}) {
    return PageRouteBuilder<void>(
      pageBuilder: (_, __, ___) => Scaffold(
        backgroundColor: AppColors.background,
        appBar: const CommonAppBar(
          title: '',
        ),
        body: Center(
          child: NetworkError(onRetry: onRetry),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: AppSpacing.xlg),
        const Icon(
          Icons.error_outline,
          size: 80,
          color: AppColors.mediumHighEmphasisSurface,
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          l10n.networkError,
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.lg),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxxlg),
          child: AppButton.darkAqua(
            onPressed: onRetry,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 0,
                  child: Icon(Icons.refresh, size: UITextStyle.button.fontSize),
                ),
                const SizedBox(width: AppSpacing.xs),
                Flexible(
                  child: Text(
                    l10n.networkErrorButton,
                    style: UITextStyle.button,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xlg),
      ],
    );
  }
}
