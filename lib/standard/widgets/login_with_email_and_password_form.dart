import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';

import '/standard/appUi/generated/assets.gen.dart';
import '/standard/appUi/spacing/app_spacing.dart';
import '/standard/appUi/widgets/app_button.dart';
import '/standard/appUi/widgets/app_email_text_field.dart';
import '/standard/appUi/widgets/app_password_text_field.dart';
import '/standard/bloc/login_bloc.dart';
import '/standard/bloc/login_event.dart';
import '/standard/bloc/login_state.dart';

const emailText = 'regular@email.com';
const passwordText = 'test1234';

class LoginWithEmailAndPasswordForm extends StatelessWidget {
  const LoginWithEmailAndPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  AppLocalizations.of(context).loginWithEmailAndPasswordFailure,
                ),
              ),
            );
        }
      },
      child: const CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.xlg,
                AppSpacing.lg,
                AppSpacing.xlg,
                AppSpacing.xxlg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _HeaderTitle(),
                  SizedBox(height: AppSpacing.xxxlg),
                  _EmailInput(),
                  _PasswordInput(),
                  _TermsAndPrivacyPolicyLinkTexts(),
                  Spacer(),
                  _NextButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  const _HeaderTitle();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      AppLocalizations.of(context).loginWithEmailHeaderText,
      key: const Key('loginWithEmailForm_header_title'),
      style: theme.textTheme.displaySmall,
    );
  }
}

class _EmailInput extends StatefulWidget {
  const _EmailInput();

  @override
  State<_EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<_EmailInput> {
  final _controller = TextEditingController(text: emailText);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginBloc>().state;

    return AppEmailTextField(
      key: const Key('loginWithEmailForm_emailInput_textField'),
      controller: _controller,
      readOnly: state.status.isInProgress,
      hintText: AppLocalizations.of(context).loginWithEmailTextFieldHint,
      onChanged: (email) =>
          context.read<LoginBloc>().add(LoginEmailChanged(email)),
      suffix: ClearIconButton(
        iconKey:
            const Key('loginWithEmailAndPasswordForm_clearEmailIconButton'),
        visible: context
            .select((LoginBloc bloc) => bloc.state.email.value.isNotEmpty),
        onPressed: () {
          if (state.status.isInProgress) {
            return;
          }
          _controller.clear();
          context.read<LoginBloc>().add(const LoginEmailChanged(''));
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _PasswordInput extends StatefulWidget {
  const _PasswordInput();

  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  final _controller = TextEditingController(text: passwordText);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginBloc>().state;

    return AppPasswordTextField(
      key: const Key('loginWithEmailAndPasswordForm_passwordInput_textField'),
      controller: _controller,
      readOnly: state.status.isInProgress,
      hintText: AppLocalizations.of(context).loginWithPasswordTextFieldHint,
      onChanged: (password) {
        context.read<LoginBloc>().add(LoginPasswordChanged(password));
      },
      suffix: ClearIconButton(
        iconKey:
            const Key('loginWithEmailAndPasswordForm_clearPasswordIconButton'),
        visible: context
            .select((LoginBloc bloc) => bloc.state.password.value.isNotEmpty),
        onPressed: () {
          if (state.status.isInProgress) {
            return;
          }
          context.read<LoginBloc>().add(const LoginPasswordChanged(''));
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _TermsAndPrivacyPolicyLinkTexts extends StatelessWidget {
  const _TermsAndPrivacyPolicyLinkTexts();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: RichText(
        key: const Key('loginWithEmailForm_terms_and_privacy_policy'),
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: AppLocalizations.of(context).loginWithEmailSubtitleText,
              style: theme.textTheme.bodyLarge,
            ),
            TextSpan(
              text: '.',
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = context.watch<LoginBloc>().state;

    return AppButton.darkAqua(
      key: const Key('loginWithEmailForm_nextButton'),
      onPressed: state.valid
          ? () => context.read<LoginBloc>().add(EmailAndPasswordSubmitted())
          : null,
      child: state.status.isInProgress
          ? const SizedBox.square(
              dimension: 24,
              child: CircularProgressIndicator(),
            )
          : Text(l10n.nextButtonText),
    );
  }
}

@visibleForTesting
class ClearIconButton extends StatelessWidget {
  const ClearIconButton({
    required this.onPressed,
    required this.iconKey,
    required this.visible,
    super.key,
  });

  final VoidCallback? onPressed;
  final Key iconKey;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return Padding(
      key: iconKey,
      padding: const EdgeInsets.only(right: AppSpacing.md),
      child: Visibility(
        visible: visible,
        child: GestureDetector(
          onTap: onPressed,
          child: Assets.icons.closeCircle.svg(),
        ),
      ),
    );
  }
}
