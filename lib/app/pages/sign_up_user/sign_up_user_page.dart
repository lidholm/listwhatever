import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listanything/app/firebase/current_user.dart';
import 'package:listanything/app/firebase/firebase_user_repository_provider.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/navigation/current_user_provider.dart';
import 'package:listanything/app/pages/settings/settings.dart';
import 'package:listanything/app/widgets/standardWidgets/async_value_widget.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';

class SignUpUserPageNameFieldConstants {
  static const submitKeyName = 'submit';
  static const cancelKeyName = 'cancel';

  static const nameFieldName = 'name';
  static const emailFieldName = 'email';
}

class SignUpUserPageKeyConstants {
  static final formKey = GlobalKey<FormBuilderState>();
  static const submitButtonKey =
      Key(SignUpUserPageNameFieldConstants.submitKeyName);
  static const cancelButtonKey =
      Key(SignUpUserPageNameFieldConstants.cancelKeyName);
  static const Key nameFieldKey =
      Key(SignUpUserPageNameFieldConstants.nameFieldName);
  static const Key emailFieldKey =
      Key(SignUpUserPageNameFieldConstants.emailFieldName);
}

class SignUpUserPage extends ConsumerWidget {
  const SignUpUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(userChangesProvider),
      data: (user) {
        print(user);
        if (user == null) {
          return const Text('User == null');
        }
        return SignUpUserPageInner(ref: ref, user: user);
      },
    );
  }
}

class SignUpUserPageInner extends HookWidget {
  const SignUpUserPageInner({
    required this.user,
    required this.ref,
    super.key,
  });
  final User user;
  final WidgetRef ref;

  Map<String, bool> createErrorVars() {
    return {SignUpUserPageNameFieldConstants.nameFieldName: false};
  }

  @override
  Widget build(BuildContext context) {
    final errors = useState<Map<String, bool>>(createErrorVars());

    final initialValues = <String, dynamic>{
      SignUpUserPageNameFieldConstants.nameFieldName: user.displayName,
      SignUpUserPageNameFieldConstants.emailFieldName: user.email,
    };
    return CommonScaffold(
      title: 'Sign up',
      body: getFormBuilderWrapper(context, initialValues, errors),
    );
  }

  Widget getFormBuilderWrapper(
    BuildContext context,
    Map<String, dynamic> initialValues,
    ValueNotifier<Map<String, bool>> errors,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FormBuilder(
              key: SignUpUserPageKeyConstants.formKey,
              onChanged: () {
                SignUpUserPageKeyConstants.formKey.currentState!.save();
                logger.d(
                  SignUpUserPageKeyConstants.formKey.currentState!.value
                      .toString(),
                );
              },
              autovalidateMode: AutovalidateMode.disabled,
              skipDisabled: true,
              initialValue: initialValues,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 16),
                  ...getNameInput(context, initialValues, errors),
                  const SizedBox(height: 16),
                  ...getEmailInput(context, initialValues, errors),
                  const SizedBox(height: 16),
                  cancelAndSubmitButtons(context, initialValues),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getNameInput(
    BuildContext context,
    Map<String, dynamic> initialValues,
    ValueNotifier<Map<String, bool>> errors,
  ) {
    return [
      FormBuilderTextField(
        initialValue:
            (initialValues[SignUpUserPageNameFieldConstants.nameFieldName] ??
                '') as String,
        autovalidateMode: AutovalidateMode.always,
        name: SignUpUserPageNameFieldConstants.nameFieldName,
        key: SignUpUserPageKeyConstants.nameFieldKey,
        decoration: InputDecoration(
          labelText: 'Name',
          hintText: 'Required name',
          suffixIcon:
              errors.value[SignUpUserPageNameFieldConstants.nameFieldName] ??
                      false
                  ? const Icon(Icons.error, color: Colors.red)
                  : const Icon(Icons.check, color: Colors.green),
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
        onChanged: (val) {
          final field = SignUpUserPageKeyConstants.formKey.currentState
              ?.fields[SignUpUserPageNameFieldConstants.nameFieldName];
          final valid = field?.validate() ?? false;
          errors.value = {
            ...errors.value,
            SignUpUserPageNameFieldConstants.nameFieldName: !valid
          };
        },
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(50),
        ]),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
      ),
    ];
  }

  List<Widget> getEmailInput(
    BuildContext context,
    Map<String, dynamic> initialValues,
    ValueNotifier<Map<String, bool>> errors,
  ) {
    return [
      FormBuilderTextField(
        initialValue:
            (initialValues[SignUpUserPageNameFieldConstants.emailFieldName] ??
                '') as String,
        autovalidateMode: AutovalidateMode.always,
        name: SignUpUserPageNameFieldConstants.emailFieldName,
        key: SignUpUserPageKeyConstants.emailFieldKey,
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Required email',
          suffixIcon:
              errors.value[SignUpUserPageNameFieldConstants.emailFieldName] ??
                      false
                  ? const Icon(Icons.error, color: Colors.red)
                  : const Icon(Icons.check, color: Colors.green),
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
        onChanged: (val) {
          final field = SignUpUserPageKeyConstants.formKey.currentState
              ?.fields[SignUpUserPageNameFieldConstants.emailFieldName];
          final valid = field?.validate() ?? false;
          errors.value = {
            ...errors.value,
            SignUpUserPageNameFieldConstants.emailFieldName: !valid
          };
        },
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(50),
        ]),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
      ),
    ];
  }

  Future<void> saveUser(
    GoRouter router,
    Map<String, dynamic> initialValues,
  ) async {
    final fields = SignUpUserPageKeyConstants.formKey.currentState?.fields;
    logger.d('fields: $fields');

    final values = <String, dynamic>{};
    logger.d('values: $values');
    final name = (values[SignUpUserPageNameFieldConstants.nameFieldName] ??
            initialValues[SignUpUserPageNameFieldConstants.nameFieldName])
        as String;
    final email = (values[SignUpUserPageNameFieldConstants.emailFieldName] ??
            initialValues[SignUpUserPageNameFieldConstants.emailFieldName])
        as String;

    final repo = await ref.read(currentUserRepositoryProvider.future);
    await repo.updateItem(
      item: CurrentUser(
        email: email,
        isAdmin: false,
        settings: defaultSettings,
        uid: user.uid,
        name: name,
      ),
      itemId: user.uid,
    );
    router.pop();
  }

  Widget cancelAndSubmitButtons(
    BuildContext context,
    Map<String, dynamic> initialValues,
  ) {
    return Row(
      children: <Widget>[
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              SignUpUserPageKeyConstants.formKey.currentState?.reset();
            },
            child: const Text(
              'Reset',
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (SignUpUserPageKeyConstants.formKey.currentState
                      ?.saveAndValidate() ??
                  false) {
                logger.d(
                  SignUpUserPageKeyConstants.formKey.currentState?.value
                      .toString(),
                );
                saveUser(GoRouter.of(context), initialValues);
              } else {
                logger
                  ..d(
                    SignUpUserPageKeyConstants.formKey.currentState?.value
                        .toString(),
                  )
                  ..d('validation failed');
              }
            },
            child: const Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
