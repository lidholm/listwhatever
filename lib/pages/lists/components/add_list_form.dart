import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:listwhatever/form/form_axis_direction.dart';
import 'package:listwhatever/form/form_generator.dart';
import 'package:listwhatever/form/form_input_field_info.dart';
import 'package:listwhatever/form/form_input_section.dart';
import 'package:listwhatever/helpers/shimmer_helper.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';

const String className = 'ListTiles';

enum SectionName {
  basic._('Basic information'),
  options._('Options'),
  shared._('Share information'),
  categoryFilterSettings._('Category filter settings'),
  submit._('Submit');

  const SectionName._(this.value);

  final String value;
}

enum FieldId {
  name._('name'),
  listType._('listType'),
  listTypeImage._('listTypeImage'),
  withMap._('withMap'),
  withDates._('withDates'),
  withTimes._('withTimes'),
  categoryFilter._('categoryFilter'),
  cancel._('cancel'),
  submit._('submit');

  const FieldId._(this.value);

  final String value;
}

class AddListForm extends StatelessWidget {
  AddListForm({
    required this.list,
    super.key,
  });
  final ListOfThings? list;

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final isLoading = false;

    final fields = [
      nameField(),
      // listTypeField(list),
      // imagePickerField(list),
      // mapCheckboxField(list),
      // dateCheckboxField(list),
      // timeCheckboxField(list),
      // ...categoryFilterSettings(list, listItems),
      // cancelButton(),
      // submitButton(list),
    ];

    final sections = [
      FormInputSection(
        name: SectionName.basic.value,
        direction: FormAxisDirection.vertical,
        showBorder: !isLoading,
      ),
      FormInputSection(
        name: SectionName.options.value,
        direction: FormAxisDirection.vertical,
        showBorder: !isLoading,
      ),
      FormInputSection(
        name: SectionName.categoryFilterSettings.value,
        direction: FormAxisDirection.vertical,
        showBorder: !isLoading,
      ),
      FormInputSection(
        name: SectionName.submit.value,
        direction: FormAxisDirection.horizontal,
        showBorder: false,
      ),
    ];

    final formGenerator = FormGenerator(
      formKey: _formKey,
      sections: sections,
      fields: isLoading
          ? ShimmerHelper.generateShimmerFormFields(5, SectionName.basic.name)
          : fields,
      isLoading: isLoading,
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: formGenerator,
      ),
    );
  }

  FormInputFieldInfo nameField() {
    return FormInputFieldInfo.textArea(
      id: FieldId.name.value,
      label: 'Name',
      currentValue: list?.name ?? '',
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(70),
      ],
      sectionName: SectionName.basic.value,
    );
  }
}
