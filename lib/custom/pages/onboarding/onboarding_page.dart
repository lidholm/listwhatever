import 'package:flutter/material.dart'; // hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '/l10n/l10n.dart';
import '/standard/app/bloc/app_bloc.dart';
import '/standard/app/bloc/app_event.dart';
import '/standard/app/bloc/app_state.dart';
import '/standard/appUi/typography/app_text_styles.dart';
import '/standard/constants.dart';
import '/standard/settings/settings.dart';
import '/standard/userRepository/models/user.dart';
import '/standard/widgets/appBar/app_bar_action.dart';
import '/standard/widgets/appBar/app_bar_action_icon.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import '/standard/widgets/vStack/v_stack.dart';

enum OnboardingValues {
  name,
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _nameHasError = false;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppBloc>().state;

    if (appState is! OnboardingRequired) {
      return const Text('Onboarding is not required (or wrong type here)');
    }

    final originalUser = appState.user;

    return SafeArea(
      child: Scaffold(
        appBar: CommonAppBar(
          title: AppLocalizations.of(context).onboardingHeader,
          actions: [
            AppBarAction(
              type: AppBarActionType.icon,
              iconAction: AppBarActionIcon(
                title: 'Log out',
                icon: Icons.logout,
                key: const Key('logoutAction'),
                callback: () async {
                  context.read<AppBloc>().add(const AppLogoutRequested());
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: createForm(
              originalUser,
              [
                header('Personal info'),
                padLeft(createNameField()),
                createDivider(),
                const SizedBox(height: 40),
                Row(
                  children: <Widget>[
                    createResetButton(context),
                    const SizedBox(width: 20),
                    createSaveButton(originalUser),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FormBuilder createForm(User user, List<Widget> children) {
    final initialValue = {
      OnboardingValues.name.toString(): user.name,
    };

    return FormBuilder(
      key: _formKey,
      onChanged: () {
        _formKey.currentState!.save();
        // logger.d(_formKey.currentState!.value.toString());
      },
      autovalidateMode: AutovalidateMode.disabled,
      initialValue: initialValue,
      skipDisabled: true,
      child: VStack(
        verticalAlignment: VerticalAlignment.leading,
        children: children,
      ),
    );
  }

  Widget header(String header, [Widget? button]) {
    final text = Text(
      header,
      style: UITextStyle.subtitle1,
    );
    if (button != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [text, button],
      );
    } else {
      return text;
    }
  }

  FormBuilderTextField createNameField() {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.always,
      name: OnboardingValues.name.toString(),
      decoration: InputDecoration(
        labelText: 'Name',
        suffixIcon: _nameHasError
            ? const Icon(Icons.error, color: Colors.red)
            : const Icon(Icons.check, color: Colors.green),
      ),
      onChanged: (val) {
        setState(() {
          _nameHasError = !(_formKey
                  .currentState?.fields[OnboardingValues.name.toString()]
                  ?.validate() ??
              false);
        });
      },
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.max(70),
      ]),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }

  Expanded createSaveButton(User originalUser) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.saveAndValidate() ?? false) {
            // logger.d(_formKey.currentState?.value.toString());
            save(originalUser, _formKey.currentState);
          } else {
            logger
              ..d(_formKey.currentState?.value.toString())
              ..d('validation failed');
          }
        },
        child: const Text(
          'Save',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Expanded createResetButton(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          _formKey.currentState?.reset();
        },
        child: Text(
          'Reset',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }

  void save(User originalUser, FormBuilderState? currentState) {
    final values = <String, dynamic>{};
    for (final entry in currentState!.fields.entries) {
      values[entry.key] = entry.value.value;
    }

    logger.d('values: $values   ');
    final user = User(
      name: values[OnboardingValues.name.toString()]! as String,
      settings: defaultSettings,
      id: originalUser.id,
      email: originalUser.email,
      photo: originalUser.photo,
    );

    if (originalUser.name.isEmpty) {
      logger.d('$this => adding firestoreUser $user   ');
      BlocProvider.of<AppBloc>(context).add(AddUser(user: user));
    } else {
      logger.d('$this => updating firestoreUser $user   ');
      BlocProvider.of<AppBloc>(context).add(UpdateUser(user: user));
    }
  }

  Widget padLeft(Widget child) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: child,
    );
  }

  Divider createDivider() {
    return const Divider(
      height: 20,
      thickness: 2,
      indent: 24,
      endIndent: 24,
      color: Colors.black,
    );
  }
}
