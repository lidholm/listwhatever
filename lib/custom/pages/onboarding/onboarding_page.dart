import 'package:flutter/material.dart'; // hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:listwhatever/standard/form/form_generator.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:listwhatever/standard/form/form_input_section.dart';

import '/l10n/l10n.dart';
import '/standard/app/bloc/app_bloc.dart';
import '/standard/app/bloc/app_event.dart';
import '/standard/app/bloc/app_state.dart';
import '/standard/constants.dart';
import '/standard/settings/settings.dart';
import '/standard/userRepository/models/user.dart';
import '/standard/widgets/appBar/app_bar_action.dart';
import '/standard/widgets/appBar/app_bar_action_icon.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import '/standard/widgets/vStack/x_stack.dart' as x_stack;

const String className = 'AddListItemPage';

enum SectionName {
  personalinfo._('personalinfo'),
  submit._('submit');

  const SectionName._(this.value);

  final String value;
}

enum FieldId {
  name._('name'),
  cancel._('cancel'),
  submit._('submit');

  const FieldId._(this.value);

  final String value;
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  static String className = 'OnboardingPage';
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppBloc>().state;

    if (appState is! OnboardingRequired) {
      return const Text('Onboarding is not required (or wrong type here)');
    }

    final originalUser = appState.user;

    final fields = [
      nameInputField(),
      cancelButton(),
      submitButton(originalUser),
    ];
    print('fields: ${fields.length}');

    final sections = getSections();

    final formGenerator = FormGenerator(
      formKey: _formKey,
      sections: sections,
      fields: fields,
    );

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
        body: formGenerator,
      ),
    );
  }

  List<FormInputSection> getSections() {
    return [
      FormInputSection(
        name: SectionName.personalinfo.name,
        direction: x_stack.AxisDirection.vertical,
        showBorder: false,
      ),
      FormInputSection(
        name: SectionName.submit.name,
        direction: x_stack.AxisDirection.horizontal,
        showBorder: false,
      ),
    ];
  }

  FormInputFieldInfo nameInputField() {
    return FormInputFieldInfo.textArea(
      id: FieldId.name.name,
      label: 'Name',
      currentValue: '',
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(150),
      ],
      sectionName: SectionName.personalinfo.name,
    );
  }

  FormInputFieldInfo cancelButton() {
    return FormInputFieldInfo.cancelButton(
      id: FieldId.cancel.name,
      label: 'Cancel',
      sectionName: SectionName.submit.name,
      cancel: () {
        print('cancelled');
      },
    );
  }

  FormInputFieldInfo submitButton(User originalUser) {
    return FormInputFieldInfo.submitButton(
      id: FieldId.submit.name,
      label: 'Submit',
      sectionName: SectionName.submit.name,
      save: (Map<String, dynamic>? values) {
        print('save');
        if (values == null) {
          print('No values to save');
          return;
        }
        save(originalUser, values);
      },
    );
  }

  void save(User originalUser, Map<String, dynamic> values) {
    logger.d('values: $values   ');
    final user = User(
      name: values[FieldId.name.name]! as String,
      settings: defaultSettings,
      id: originalUser.id,
      email: originalUser.email,
      photo: originalUser.photo,
    );

    if (originalUser.name.isEmpty) {
      logger.d('$className => adding firestoreUser $user   ');
      BlocProvider.of<AppBloc>(context).add(AddUser(user: user));
    } else {
      logger.d('$className => updating firestoreUser $user   ');
      BlocProvider.of<AppBloc>(context).add(UpdateUser(user: user));
    }
  }
}
