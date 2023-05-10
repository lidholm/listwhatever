import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listanything/app/common_theme_data.dart';
import 'package:listanything/app/firebase/firebase_user_repository_provider.dart';
import 'package:listanything/app/firebase/firestore_user.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/navigation/current_user_provider.dart';
import 'package:listanything/app/pages/settings/settings.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';
import 'package:listanything/l10n/l10n.dart';

class _SettingsFormNameFieldConstants {
  static const submitKeyName = 'submit';
  static const cancelKeyName = 'cancel';
  static const scrollerKeyName = 'scroller';
  static const distanceUnitField = 'distanceUnit';
  static const clockTypeField = 'clockType';
  static const dateFormatTypeField = 'dateFormatType';
}

class _SettingsFormKeyConstants {
  static final formKey = GlobalKey<FormBuilderState>();
  static const submitButtonKey =
      Key(_SettingsFormNameFieldConstants.submitKeyName);
  static const cancelButtonKey =
      Key(_SettingsFormNameFieldConstants.cancelKeyName);
  static const scrollerKey =
      Key(_SettingsFormNameFieldConstants.scrollerKeyName);
  static const Key distanceUnitFieldKey =
      Key(_SettingsFormNameFieldConstants.distanceUnitField);
  static const Key clockTypeFieldKey =
      Key(_SettingsFormNameFieldConstants.clockTypeField);
  static const Key dateFormatTypeFieldKey =
      Key(_SettingsFormNameFieldConstants.dateFormatTypeField);
}

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentUserProvider).when(
          error: (e, st) => Text('$e'),
          loading: () => const Text(''),
          data: (firestoreUser) {
            if (firestoreUser == null) {
              return const Text('No user');
            }
            return CommonScaffold(
              title: 'Settings',
              body: body(context, ref, firestoreUser),
            );
          },
        );
  }

  Widget body(
    BuildContext context,
    WidgetRef ref,
    FirestoreUser firestoreUser,
  ) {
    final errors = useState<Map<String, bool>>(createErrorVars());
    final initialValues = useState(createInitialValues(firestoreUser.settings));

    return getFormBuilderWrapper(
      children: [
        pageHeader(
          'Settings',
        ),
        const SizedBox(height: 8),
        getDistanceUnitInput(context, initialValues, errors),
        const SizedBox(height: 8),
        getAmPmInput(context, initialValues, errors),
        const SizedBox(height: 8),
        getDateFormatInput(context, initialValues, errors),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getCancelButton(context),
            const SizedBox(width: 20),
            getSubmitButton(context, ref, firestoreUser),
          ],
        ),
      ],
    );
  }

  Map<String, dynamic> createInitialValues(Settings settings) {
    final values = <String, dynamic>{
      _SettingsFormNameFieldConstants.distanceUnitField: settings.distanceUnit,
      _SettingsFormNameFieldConstants.clockTypeField: settings.clockType,
      _SettingsFormNameFieldConstants.dateFormatTypeField:
          settings.dateFormatType,
    };
    return values;
  }

  Widget pageHeader(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: header1style,
        )
      ],
    );
  }

  Widget sectionHeader(String text, [Widget? button]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: sectionHeaderStyle,
        ),
        if (button != null) button
      ],
    );
  }

  Map<String, bool> createErrorVars() {
    return {
      _SettingsFormNameFieldConstants.distanceUnitField: false,
      _SettingsFormNameFieldConstants.clockTypeField: false,
      _SettingsFormNameFieldConstants.dateFormatTypeField: false,
    };
  }

  Widget getFormBuilderWrapper({required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        key: _SettingsFormKeyConstants.scrollerKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FormBuilder(
              key: _SettingsFormKeyConstants.formKey,
              onChanged: () {
                _SettingsFormKeyConstants.formKey.currentState!.save();
              },
              autovalidateMode: AutovalidateMode.disabled,
              skipDisabled: true,
              child: Column(
                children: children,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getDistanceUnitInput(
    BuildContext context,
    ValueNotifier<Map<String, dynamic>> initialValues,
    ValueNotifier<Map<String, bool>> errors,
  ) {
    final dropdownItems = DistanceUnitType.values.map(
      (unitType) {
        final text = AppLocalizations.of(context).distanceUnit(unitType.name);

        return DropdownMenuItem<DistanceUnitType>(
          alignment: AlignmentDirectional.center,
          value: unitType,
          child: Text(text),
        );
      },
    ).toList();
    return FormBuilderDropdown<DistanceUnitType>(
      name: _SettingsFormNameFieldConstants.distanceUnitField,
      key: _SettingsFormKeyConstants.distanceUnitFieldKey,
      initialValue:
          initialValues.value[_SettingsFormNameFieldConstants.distanceUnitField]
              as DistanceUnitType?,
      decoration: InputDecoration(
        labelText: 'Distance Unit',
        suffix:
            errors.value[_SettingsFormNameFieldConstants.distanceUnitField] ??
                    true
                ? const Icon(Icons.error, color: Colors.red)
                : const Icon(Icons.check, color: Colors.green),
        hintText: 'Distance Unit',
      ),
      validator: FormBuilderValidators.compose(
        [FormBuilderValidators.required()],
      ),
      items: dropdownItems,
      onChanged: (val) {
        final field = _SettingsFormKeyConstants.formKey.currentState
            ?.fields[_SettingsFormNameFieldConstants.distanceUnitField];
        final valid = field?.validate() ?? false;
        errors.value = {
          ...errors.value,
          _SettingsFormNameFieldConstants.distanceUnitField: !valid
        };
      },
      valueTransformer: (val) => val?.toString(),
    );
  }

  Widget getAmPmInput(
    BuildContext context,
    ValueNotifier<Map<String, dynamic>> initialValues,
    ValueNotifier<Map<String, bool>> errors,
  ) {
    final dropdownItems = ClockType.values.map(
      (option) {
        final text = AppLocalizations.of(context).ampm(option.name);
        return DropdownMenuItem<ClockType>(
          alignment: AlignmentDirectional.center,
          value: option,
          child: Text(text),
        );
      },
    ).toList();
    return FormBuilderDropdown<ClockType>(
      name: _SettingsFormNameFieldConstants.clockTypeField,
      key: _SettingsFormKeyConstants.clockTypeFieldKey,
      initialValue: initialValues
          .value[_SettingsFormNameFieldConstants.clockTypeField] as ClockType?,
      decoration: InputDecoration(
        labelText: 'Clock type',
        suffix:
            errors.value[_SettingsFormNameFieldConstants.clockTypeField] ?? true
                ? const Icon(Icons.error, color: Colors.red)
                : const Icon(Icons.check, color: Colors.green),
        hintText: 'Clock type',
      ),
      validator: FormBuilderValidators.compose(
        [FormBuilderValidators.required()],
      ),
      items: dropdownItems,
      onChanged: (val) {
        final field = _SettingsFormKeyConstants.formKey.currentState
            ?.fields[_SettingsFormNameFieldConstants.clockTypeField];
        final valid = field?.validate() ?? false;
        errors.value = {
          ...errors.value,
          _SettingsFormNameFieldConstants.clockTypeField: !valid
        };
      },
      valueTransformer: (val) => val?.toString(),
    );
  }

  Widget getDateFormatInput(
    BuildContext context,
    ValueNotifier<Map<String, dynamic>> initialValues,
    ValueNotifier<Map<String, bool>> errors,
  ) {
    final dropdownItems = dateFormatTypesInInputs.map(
      (option) {
        final text = AppLocalizations.of(context).dateformat(option.name);
        return DropdownMenuItem<DateFormatType>(
          alignment: AlignmentDirectional.center,
          value: option,
          child: Text(text),
        );
      },
    ).toList();
    return FormBuilderDropdown<DateFormatType>(
      name: _SettingsFormNameFieldConstants.dateFormatTypeField,
      key: _SettingsFormKeyConstants.dateFormatTypeFieldKey,
      initialValue: initialValues
              .value[_SettingsFormNameFieldConstants.dateFormatTypeField]
          as DateFormatType?,
      decoration: InputDecoration(
        labelText: 'Date format',
        suffix:
            errors.value[_SettingsFormNameFieldConstants.dateFormatTypeField] ??
                    true
                ? const Icon(Icons.error, color: Colors.red)
                : const Icon(Icons.check, color: Colors.green),
        hintText: 'Date format',
      ),
      validator: FormBuilderValidators.compose(
        [FormBuilderValidators.required()],
      ),
      items: dropdownItems,
      onChanged: (val) {
        final field = _SettingsFormKeyConstants.formKey.currentState
            ?.fields[_SettingsFormNameFieldConstants.dateFormatTypeField];
        final valid = field?.validate() ?? false;
        errors.value = {
          ...errors.value,
          _SettingsFormNameFieldConstants.dateFormatTypeField: !valid
        };
      },
      valueTransformer: (val) => val?.toString(),
    );
  }

  OutlinedButton getCancelButton(BuildContext context) {
    return OutlinedButton(
      key: _SettingsFormKeyConstants.cancelButtonKey,
      onPressed: () {
        _SettingsFormKeyConstants.formKey.currentState?.reset();
        logger.d('Settings page: pop once');
        getGoRouter(context).pop();
      },
      child: const Text(
        'Cancel',
      ),
    );
  }

  ElevatedButton getSubmitButton(
    BuildContext context,
    WidgetRef ref,
    FirestoreUser firestoreUser,
  ) {
    return ElevatedButton(
      key: _SettingsFormKeyConstants.submitButtonKey,
      onPressed: () {
        if (_SettingsFormKeyConstants.formKey.currentState?.saveAndValidate() ??
            false) {
          saveListItem(
            getGoRouter(context),
            ref,
            firestoreUser,
          );
        } else {
          final errorFields = _SettingsFormKeyConstants
              .formKey.currentState?.fields.values
              .where((element) => element.hasError)
              .toList();
          logger
            ..d('errorFields: $errorFields')
            ..d('validation failed');
        }
      },
      child: const Text(
        'Submit',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  GoRouter getGoRouter(BuildContext context) {
    return GoRouter.of(context);
  }

  Future<void> saveListItem(
    GoRouter router,
    WidgetRef ref,
    FirestoreUser firestoreUser,
  ) async {
    final fields = _SettingsFormKeyConstants.formKey.currentState!.fields;
    final repo = await ref.read(fiirebaseUserRepositoryProvider.future);
    final selectedUserValue = ref.read(currentUserProvider);

    await selectedUserValue.when(
      error: (e, st) {
        logger.e(e);
      },
      loading: () {},
      data: (selectedUser) async {
        final distanceUnit =
            fields[_SettingsFormNameFieldConstants.distanceUnitField]!.value
                as DistanceUnitType;
        final clockType =
            fields[_SettingsFormNameFieldConstants.clockTypeField]!.value
                as ClockType;
        final dateFormatType =
            fields[_SettingsFormNameFieldConstants.dateFormatTypeField]!.value
                as DateFormatType;

        final settings = Settings(
          distanceUnit: distanceUnit,
          clockType: clockType,
          dateFormatType: dateFormatType,
          readableDateFormatType: firestoreUser.settings.readableDateFormatType,
        );
        final userId = selectedUser!.uid;
        final refId = await repo.updateItem(
          itemId: userId,
          item: firestoreUser.copyWith(settings: settings),
        );

        logger.d('Updated $refId');

        router.pop();
      },
    );
  }
}
