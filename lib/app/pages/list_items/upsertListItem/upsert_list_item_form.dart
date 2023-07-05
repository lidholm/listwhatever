import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:listanything/app/common_theme_data.dart';
import 'package:listanything/app/firebase/current_user.dart';
import 'package:listanything/app/geocoder/geocoderresult.dart';
import 'package:listanything/app/geocoder/latlong.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/navigation/current_user_provider.dart';
import 'package:listanything/app/navigation/routes/routes.dart';
import 'package:listanything/app/navigation/routes/search_location_for_add_page_route.dart';
import 'package:listanything/app/navigation/routes/search_location_for_edit_page_route.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_repository_provider.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/settings/settings.dart';
import 'package:listanything/app/widgets/standardWidgets/app_bar_action.dart';
import 'package:listanything/app/widgets/standardWidgets/async_value_widget.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';

class UpsertListItemFormNameFieldConstants {
  static const submitKeyName = 'submit';
  static const cancelKeyName = 'cancel';
  static const deleteKeyName = 'delete';
  static const scrollerKeyName = 'scroller';

  static const nameField = 'name';
  static const infoFieldName = 'info';
  static const dateTimeField = 'date';
  static const addressFieldName = 'address';
  static const latFieldName = 'lat';
  static const longFieldName = 'long';
  static const addUrlButtonName = 'urlsadd';
  static String getUrlFieldName(int index) => 'url-$index';
  static const addCategoryButtonName = 'categoryadd';
  static String getCategoryNameFieldName(int index) => 'categoryName-$index';
  static String getCategoryValueFieldName(int index) => 'categoryValue-$index';
  static const String searchAddressButtonName = 'searchaddressbutton';
  static const String searchPhraseFieldName = 'searchPhrase';
}

class UpsertListItemFormKeyConstants {
  static final formKey = GlobalKey<FormBuilderState>();
  static const submitButtonKey =
      Key(UpsertListItemFormNameFieldConstants.submitKeyName);
  static const deleteButtonKey =
      Key(UpsertListItemFormNameFieldConstants.deleteKeyName);
  static const cancelButtonKey =
      Key(UpsertListItemFormNameFieldConstants.cancelKeyName);
  static const scrollerKey =
      Key(UpsertListItemFormNameFieldConstants.scrollerKeyName);
  static const Key nameFieldKey =
      Key(UpsertListItemFormNameFieldConstants.nameField);
  static const Key addUrlButtonKey =
      Key(UpsertListItemFormNameFieldConstants.addUrlButtonName);
  static const Key infoFieldKey =
      Key(UpsertListItemFormNameFieldConstants.infoFieldName);
  static const Key dateFieldKey =
      Key(UpsertListItemFormNameFieldConstants.dateTimeField);
  static const Key addressFieldKey =
      Key(UpsertListItemFormNameFieldConstants.addressFieldName);
  static const Key latFieldKey =
      Key(UpsertListItemFormNameFieldConstants.latFieldName);
  static const Key longFieldKey =
      Key(UpsertListItemFormNameFieldConstants.longFieldName);
  static Key getUrlFieldKey(int index) =>
      Key(UpsertListItemFormNameFieldConstants.getUrlFieldName(index));
  static Key getCategoryNameFieldKey(int index) =>
      Key(UpsertListItemFormNameFieldConstants.getCategoryNameFieldName(index));
  static Key getCategoryValueFieldKey(int index) => Key(
        UpsertListItemFormNameFieldConstants.getCategoryValueFieldName(index),
      );
  static const Key addCategoryButtonKey =
      Key(UpsertListItemFormNameFieldConstants.addCategoryButtonName);
  static const Key searchAddressButtonKey =
      Key(UpsertListItemFormNameFieldConstants.searchAddressButtonName);
  static const Key searchPhraseKey =
      Key(UpsertListItemFormNameFieldConstants.searchPhraseFieldName);
}

class UpsertListItemForm extends HookConsumerWidget {
  const UpsertListItemForm({
    required this.listItem,
    required this.list,
    super.key,
  });
  final ListItem? listItem;
  final ListOfThings list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errors = useState<Map<String, bool>>(createErrorVars());
    final initialValues = useState(createInitialValues(listItem));

    return AsyncValueWidget(
      value: ref.watch(currentUserProvider),
      data: (firestoreUser) => CommonScaffold(
        title: listItem == null ? 'Add List Item' : 'Edit List Item',
        actions: [
          if (listItem != null)
            AppBarAction(
              key: UpsertListItemFormKeyConstants.deleteButtonKey,
              title: 'Delete',
              icon: Icons.delete,
              callback: () {
                deleteListItem(
                  ref,
                  getGoRouter(context),
                  list.publicListId!,
                  listItem!.id!,
                );
              },
              overflow: false,
            )
        ],
        body: getFormBuilderWrapper(
          children: [
            pageHeader(
              listItem == null ? 'Add a new list item' : 'Edit list item',
            ),
            const SizedBox(height: 8),
            sectionHeader('Name'),
            const SizedBox(height: 8),
            ...getNameInput(context, initialValues, errors),
            const SizedBox(height: 8),
            sectionHeader('Extra information'),
            const SizedBox(height: 8),
            getExtraInfoInput(context, initialValues, errors),
            const SizedBox(height: 24),
            ...getAddressInputs(context, initialValues, errors),
            const SizedBox(height: 16),
            sectionHeader('Date'),
            const SizedBox(height: 8),
            getDateInputs(list, initialValues, firestoreUser),
            const SizedBox(height: 16),
            ...getUrlInputs(
              initialValues,
              errors,
            ),
            const SizedBox(height: 16),
            ...getCategoriesWidgets(
              initialValues,
              errors,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getCancelButton(context),
                const SizedBox(width: 20),
                getSubmitButton(context, ref),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> createInitialValues(ListItem? listItem) {
    if (listItem == null) {
      return <String, dynamic>{};
    }
    final values = <String, dynamic>{
      UpsertListItemFormNameFieldConstants.nameField: listItem.name,
      UpsertListItemFormNameFieldConstants.infoFieldName: listItem.info,
      UpsertListItemFormNameFieldConstants.addressFieldName: listItem.address,
      UpsertListItemFormNameFieldConstants.latFieldName: listItem.latLong?.lat,
      UpsertListItemFormNameFieldConstants.longFieldName: listItem.latLong?.lng,
      UpsertListItemFormNameFieldConstants.dateTimeField: listItem.datetime,
    };
    for (final url in listItem.urls) {
      values[UpsertListItemFormNameFieldConstants.getUrlFieldName(
        listItem.urls.indexOf(url),
      )] = url;
    }
    for (final c in mapIndexed(listItem.categories.entries)) {
      final index = c.key;
      final categoryName = c.value.key;
      final categoryValues = c.value.value;

      values[UpsertListItemFormNameFieldConstants.getCategoryNameFieldName(
        index,
      )] = categoryName;
      values[UpsertListItemFormNameFieldConstants.getCategoryValueFieldName(
        index,
      )] = categoryValues.join(',');
    }
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
    return {UpsertListItemFormNameFieldConstants.nameField: false};
  }

  Widget getFormBuilderWrapper({required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        key: UpsertListItemFormKeyConstants.scrollerKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FormBuilder(
              key: UpsertListItemFormKeyConstants.formKey,
              onChanged: () {
                UpsertListItemFormKeyConstants.formKey.currentState!.save();
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

  List<Widget> getNameInput(
    BuildContext context,
    ValueNotifier<Map<String, dynamic>> initialValues,
    ValueNotifier<Map<String, bool>> errors,
  ) {
    return [
      FormBuilderTextField(
        initialValue: (initialValues
                .value[UpsertListItemFormNameFieldConstants.nameField] ??
            '') as String,
        autovalidateMode: AutovalidateMode.always,
        name: UpsertListItemFormNameFieldConstants.nameField,
        key: UpsertListItemFormKeyConstants.nameFieldKey,
        decoration: InputDecoration(
          labelText: 'Item name',
          hintText: 'Required item name',
          suffixIcon:
              errors.value[UpsertListItemFormNameFieldConstants.nameField] ??
                      true
                  ? const Icon(Icons.error, color: Colors.red)
                  : const Icon(Icons.check, color: Colors.green),
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
        onChanged: (val) {
          final field = UpsertListItemFormKeyConstants.formKey.currentState
              ?.fields[UpsertListItemFormNameFieldConstants.nameField];
          final valid = field?.validate() ?? false;
          errors.value = {
            ...errors.value,
            UpsertListItemFormNameFieldConstants.nameField: !valid
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

  Widget getExtraInfoInput(
    BuildContext context,
    ValueNotifier<Map<String, dynamic>> initialValues,
    ValueNotifier<Map<String, bool>> errors,
  ) {
    return FormBuilderTextField(
      initialValue: (initialValues
              .value[UpsertListItemFormNameFieldConstants.infoFieldName] ??
          '') as String,
      autovalidateMode: AutovalidateMode.always,
      name: UpsertListItemFormNameFieldConstants.infoFieldName,
      key: UpsertListItemFormKeyConstants.infoFieldKey,
      minLines: 3,
      maxLines: 6,
      decoration: InputDecoration(
        labelText: 'Extra info',
        hintText: 'Optional extra info',
        suffixIcon:
            errors.value[UpsertListItemFormNameFieldConstants.infoFieldName] ??
                    true
                ? const Icon(Icons.error, color: Colors.red)
                : const Icon(Icons.check, color: Colors.green),
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
      onChanged: (val) {
        final field = UpsertListItemFormKeyConstants.formKey.currentState
            ?.fields[UpsertListItemFormNameFieldConstants.infoFieldName];
        final valid = field?.validate() ?? false;
        errors.value = {
          ...errors.value,
          UpsertListItemFormNameFieldConstants.infoFieldName: !valid
        };
      },
      // valueTransformer: (text) => num.tryParse(text),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.maxLength(1000),
        ],
      ),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.newline,
    );
  }

  List<Widget> getAddressInputs(
    BuildContext context,
    ValueNotifier<Map<String, dynamic>> initialValues,
    ValueNotifier<Map<String, bool>> errors,
  ) {
    return [
      if (list.withMap) ...[
        sectionHeader(
          'Address information',
          ElevatedButton(
            key: UpsertListItemFormKeyConstants.searchAddressButtonKey,
            onPressed: () async {
              final result = listItem == null
                  ? await addSearchLocation(
                      context,
                      listItem?.searchPhrase,
                      list.publicListId!,
                      listItem?.id ?? '',
                    )
                  : await editSearchLocation(
                      context,
                      listItem?.searchPhrase,
                      list.publicListId!,
                      listItem?.id ?? '',
                    );
              logger.d('result: $result');

              UpsertListItemFormKeyConstants
                  .formKey
                  .currentState
                  ?.fields[
                      UpsertListItemFormNameFieldConstants.addressFieldName]
                  ?.didChange(result?.formattedAddress);

              UpsertListItemFormKeyConstants.formKey.currentState
                  ?.fields[UpsertListItemFormNameFieldConstants.latFieldName]
                  ?.didChange('${result?.geometry.location.lat}');

              UpsertListItemFormKeyConstants.formKey.currentState
                  ?.fields[UpsertListItemFormNameFieldConstants.longFieldName]
                  ?.didChange('${result?.geometry.location.lng}');

              UpsertListItemFormKeyConstants
                  .formKey
                  .currentState
                  ?.fields[UpsertListItemFormNameFieldConstants
                      .searchPhraseFieldName]
                  ?.didChange(result?.searchPhrase ?? '');
            },
            child: const Text('Search map'),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        FormBuilderTextField(
          autovalidateMode: AutovalidateMode.always,
          key: UpsertListItemFormKeyConstants.addressFieldKey,
          name: UpsertListItemFormNameFieldConstants.addressFieldName,
          initialValue: (initialValues
                  .value[UpsertListItemFormNameFieldConstants.addressFieldName])
              as String?,
          decoration: InputDecoration(
            labelText: 'Address',
            suffixIcon: errors.value[UpsertListItemFormNameFieldConstants
                        .addressFieldName] ??
                    true
                ? const Icon(Icons.error, color: Colors.red)
                : const Icon(Icons.check, color: Colors.green),
          ),
          onChanged: (val) {
            final field = UpsertListItemFormKeyConstants.formKey.currentState
                ?.fields[UpsertListItemFormNameFieldConstants.addressFieldName];
            final valid = field?.validate() ?? false;
            errors.value = {
              ...errors.value,
              UpsertListItemFormNameFieldConstants.addressFieldName: !valid
            };
          },
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.maxLength(300),
          ]),
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 16),
        Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              child: FormBuilderTextField(
                autovalidateMode: AutovalidateMode.always,
                key: UpsertListItemFormKeyConstants.latFieldKey,
                name: UpsertListItemFormNameFieldConstants.latFieldName,
                initialValue: getValueOrEmptyString(
                  initialValues
                      .value[UpsertListItemFormNameFieldConstants.latFieldName],
                ),
                decoration: InputDecoration(
                  labelText: 'Latitude',
                  suffixIcon: errors.value[UpsertListItemFormNameFieldConstants
                              .latFieldName] ??
                          true
                      ? const Icon(Icons.error, color: Colors.red)
                      : const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                ),
                onChanged: (val) {
                  final field = UpsertListItemFormKeyConstants
                          .formKey.currentState?.fields[
                      UpsertListItemFormNameFieldConstants.latFieldName];
                  final valid = field?.validate() ?? false;
                  errors.value = {
                    ...errors.value,
                    UpsertListItemFormNameFieldConstants.latFieldName: !valid
                  };
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.maxLength(30),
                  (val) {
                    if (val == null) return null;
                    if (val == '') return null;
                    final number = double.tryParse(val);
                    if (number == null) return 'Has to be a number';
                    return null;
                  }
                ]),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: FormBuilderTextField(
                autovalidateMode: AutovalidateMode.always,
                key: UpsertListItemFormKeyConstants.longFieldKey,
                name: UpsertListItemFormNameFieldConstants.longFieldName,
                initialValue: getValueOrEmptyString(
                  initialValues.value[
                      UpsertListItemFormNameFieldConstants.longFieldName],
                ),
                decoration: InputDecoration(
                  labelText: 'Longitude',
                  suffixIcon: errors.value[UpsertListItemFormNameFieldConstants
                              .longFieldName] ??
                          true
                      ? const Icon(Icons.error, color: Colors.red)
                      : const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                ),
                onChanged: (val) {
                  final field = UpsertListItemFormKeyConstants
                          .formKey.currentState?.fields[
                      UpsertListItemFormNameFieldConstants.longFieldName];
                  final valid = field?.validate() ?? false;
                  errors.value = {
                    ...errors.value,
                    UpsertListItemFormNameFieldConstants.longFieldName: !valid
                  };
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.maxLength(30),
                  (val) {
                    if (val == null) return null;
                    if (val == '') return null;
                    final number = double.tryParse(val);
                    if (number == null) return 'Has to be a number';
                    return null;
                  }
                ]),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
          ],
        )
      ]
    ];
  }

  Widget getDateInputs(
    ListOfThings list,
    ValueNotifier<Map<String, dynamic>> initialValues,
    CurrentUser? firestoreUser,
  ) {
    if (!list.withDates) {
      return Container();
    }
    return FormBuilderDateTimePicker(
      key: UpsertListItemFormKeyConstants.dateFieldKey,
      name: UpsertListItemFormNameFieldConstants.dateTimeField,
      initialValue: initialValues
              .value[UpsertListItemFormNameFieldConstants.dateTimeField]
          as DateTime?,
      initialDate: initialValues
              .value[UpsertListItemFormNameFieldConstants.dateTimeField]
          as DateTime?,
      inputType: list.withTimes ? InputType.both : InputType.date,
      format: getDateFormatter(firestoreUser, list),
      decoration: InputDecoration(
        labelText: list.withTimes ? 'Date and Time' : 'Date',
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            UpsertListItemFormKeyConstants.formKey.currentState!
                .fields[UpsertListItemFormNameFieldConstants.dateTimeField]
                ?.didChange(null);
          },
        ),
      ),
    );
  }

  List<Widget> getUrlInputs(
    ValueNotifier<Map<String, dynamic>> initialValues,
    ValueNotifier<Map<String, bool>> errors,
  ) {
    final name = UpsertListItemFormNameFieldConstants.getUrlFieldName(0);
    final urls = initialValues.value.entries.where(
      (element) => element.key.startsWith(name.substring(0, name.length - 4)),
    );
    return [
      sectionHeader(
        'URLs',
        ElevatedButton(
          key: UpsertListItemFormKeyConstants.addUrlButtonKey,
          onPressed: () {
            initialValues.value = <String, dynamic>{
              ...initialValues.value,
              UpsertListItemFormNameFieldConstants.getUrlFieldName(urls.length):
                  '',
            };
            // urlIndices.value = [...urlIndices.value, urlIndices.value.length];
          },
          child: const Text('Add new URL'),
        ),
      ),
      if (urls.isEmpty) const Text('No urls yet'),
      if (urls.isNotEmpty)
        ...mapIndexed(urls).expand(
          (urlAndIndex) {
            return [
              FormBuilderTextField(
                initialValue: urlAndIndex.value.value as String,
                autovalidateMode: AutovalidateMode.always,
                name: UpsertListItemFormNameFieldConstants.getUrlFieldName(
                  urlAndIndex.key,
                ),
                key: UpsertListItemFormKeyConstants.getUrlFieldKey(
                  urlAndIndex.key,
                ),
                // initialValue: urlInitialValue[urlIndex],
                decoration: InputDecoration(
                  labelText: 'URL',
                  suffixIcon: errors.value[UpsertListItemFormNameFieldConstants
                              .infoFieldName] ??
                          true
                      ? const Icon(Icons.error, color: Colors.red)
                      : const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                ),
                onChanged: (val) {
                  final field = UpsertListItemFormKeyConstants
                          .formKey.currentState?.fields[
                      UpsertListItemFormNameFieldConstants.getUrlFieldName(
                    urlAndIndex.key,
                  )];
                  final valid = field?.validate() ?? false;
                  errors.value = {
                    ...errors.value,
                    UpsertListItemFormNameFieldConstants.getUrlFieldName(
                      urlAndIndex.key,
                    ): !valid
                  };
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.maxLength(200),
                ]),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
            ];
          },
        ),
    ];
  }

  List<Widget> getCategoriesWidgets(
    ValueNotifier<Map<String, dynamic>> initialValues,
    ValueNotifier<Map<String, bool>> errors,
  ) {
    final categoryNameFieldTemplate =
        UpsertListItemFormNameFieldConstants.getCategoryNameFieldName(0);
    final categoryNames = initialValues.value.entries
        .where(
          (element) => element.key.startsWith(
            categoryNameFieldTemplate.substring(
              0,
              categoryNameFieldTemplate.length - 4,
            ),
          ),
        )
        .toList();

    final categoryValueFieldTemplate =
        UpsertListItemFormNameFieldConstants.getCategoryValueFieldName(0);
    final categoryValues = initialValues.value.entries
        .where(
          (element) => element.key.startsWith(
            categoryValueFieldTemplate.substring(
              0,
              categoryValueFieldTemplate.length - 4,
            ),
          ),
        )
        .toList();

    return [
      sectionHeader(
        'Categories',
        ElevatedButton(
          key: UpsertListItemFormKeyConstants.addCategoryButtonKey,
          onPressed: () {
            initialValues.value = <String, dynamic>{
              ...initialValues.value,
              UpsertListItemFormNameFieldConstants.getCategoryNameFieldName(
                categoryNames.length,
              ): '',
              UpsertListItemFormNameFieldConstants.getCategoryValueFieldName(
                categoryNames.length,
              ): '',
            };
          },
          child: const Text('Add new category'),
        ),
      ),
      const SizedBox(height: 16),
      if (categoryNames.isEmpty) const Text('No categories yet'),
      if (categoryNames.isNotEmpty)
        ...mapIndexed(categoryNames).expand(
          (categoryAndIndex) {
            final index = categoryAndIndex.key;
            final categoryName = categoryNames[index].value as String;
            final categoryValue = categoryValues[index].value as String;

            final hasNameError = errors.value[
                    UpsertListItemFormNameFieldConstants
                        .getCategoryNameFieldName(
                  index,
                )] ??
                true;
            final hasValueError = errors.value[
                    UpsertListItemFormNameFieldConstants
                        .getCategoryValueFieldName(index)] ??
                true;
            return [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        hasNameError ? 15 : 0,
                        0,
                        0,
                      ),
                      child: FormBuilderTextField(
                        initialValue: categoryName,
                        autovalidateMode: AutovalidateMode.always,
                        name: UpsertListItemFormNameFieldConstants
                            .getCategoryNameFieldName(index),
                        key: UpsertListItemFormKeyConstants
                            .getCategoryNameFieldKey(index),
                        decoration: InputDecoration(
                          labelText: 'Category name',
                          suffixIcon: hasNameError
                              ? const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                        ),
                        onChanged: (val) {
                          final field = UpsertListItemFormKeyConstants
                                  .formKey.currentState?.fields[
                              UpsertListItemFormNameFieldConstants
                                  .getCategoryNameFieldName(index)];
                          final valid = field?.validate() ?? false;
                          errors.value = {
                            ...errors.value,
                            UpsertListItemFormNameFieldConstants
                                .getCategoryNameFieldName(index): !valid
                          };
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.maxLength(32),
                        ]),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        hasValueError ? 15 : 0,
                        0,
                        0,
                      ),
                      child: FormBuilderTextField(
                        initialValue: categoryValue,
                        autovalidateMode: AutovalidateMode.always,
                        name: UpsertListItemFormNameFieldConstants
                            .getCategoryValueFieldName(index),
                        key: UpsertListItemFormKeyConstants
                            .getCategoryValueFieldKey(index),
                        decoration: InputDecoration(
                          labelText: 'Category values',
                          suffixIcon: hasValueError
                              ? const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                        ),
                        onChanged: (val) {
                          final field = UpsertListItemFormKeyConstants
                                  .formKey.currentState?.fields[
                              UpsertListItemFormNameFieldConstants
                                  .getCategoryValueFieldName(index)];
                          final valid = field?.validate() ?? false;
                          errors.value = {
                            ...errors.value,
                            UpsertListItemFormNameFieldConstants
                                .getCategoryValueFieldName(index): !valid
                          };
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.maxLength(32),
                        ]),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: hasValueError ? 4 : 15,
              ),
            ];
          },
        ),
    ];
  }

  OutlinedButton getCancelButton(BuildContext context) {
    return OutlinedButton(
      key: UpsertListItemFormKeyConstants.cancelButtonKey,
      onPressed: () {
        UpsertListItemFormKeyConstants.formKey.currentState?.reset();
        logger.d('AddEditListItem: pop once');
        getGoRouter(context).pop();
      },
      child: const Text(
        'Cancel',
      ),
    );
  }

  ElevatedButton getSubmitButton(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      key: UpsertListItemFormKeyConstants.submitButtonKey,
      onPressed: () {
        if (UpsertListItemFormKeyConstants.formKey.currentState
                ?.saveAndValidate() ??
            false) {
          saveListItem(
            getGoRouter(context),
            list.publicListId!,
            listItem,
            ref,
          );
        } else {
          final errorFields = UpsertListItemFormKeyConstants
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
    String publicListId,
    ListItem? listItem,
    WidgetRef ref,
  ) async {
    final fields = UpsertListItemFormKeyConstants.formKey.currentState!.fields;
    final repo =
        await ref.read(listItemsRepositoryProvider(publicListId).future);
    final name =
        fields[UpsertListItemFormNameFieldConstants.nameField]!.value as String;
    final info = fields[UpsertListItemFormNameFieldConstants.infoFieldName]!
        .value as String?;
    final datetime = fields[UpsertListItemFormNameFieldConstants.dateTimeField]
        ?.value as DateTime?;

    final urls = fields.entries
        .where((e) => e.key.startsWith('url-'))
        .map((e) => e.value)
        .map((e) => e.value as String)
        .toList();
    final categoryNames = fields.entries
        .where((e) => e.key.startsWith('categoryName-'))
        .map((e) => e.value)
        .map((e) => e.value as String)
        .toList();
    logger.d('categoryNames: $categoryNames');
    final categoryValues = fields.entries
        .where((e) => e.key.startsWith('categoryValue-'))
        .map((e) => e.value)
        .map((e) => (e.value as String).split(', '))
        .toList();
    logger.d('categoryValues: $categoryValues');
    final address =
        fields[UpsertListItemFormNameFieldConstants.addressFieldName]?.value
            as String?;
    final searchPhrase = nullIfEmpty(
      fields[UpsertListItemFormNameFieldConstants.searchPhraseFieldName]?.value
          as String?,
    );
    final lat = nullIfEmpty(
      fields[UpsertListItemFormNameFieldConstants.latFieldName]?.value
          as String?,
    );
    final long = nullIfEmpty(
      fields[UpsertListItemFormNameFieldConstants.longFieldName]?.value
          as String?,
    );
    final latLong = lat != null
        ? LatLong(lat: double.parse(lat), lng: double.parse(long!))
        : null;

    final categories = Map.fromEntries(
      [
        for (int i = 0; i < categoryNames.length; i += 1)
          MapEntry(categoryNames[i], categoryValues[i])
      ],
    );

    if (listItem == null) {
      final listItem = ListItem(
        name: name,
        info: info ?? '',
        urls: urls,
        categories: categories,
        datetime: datetime,
        address: address,
        latLong: latLong,
        searchPhrase: searchPhrase,
      );

      final refId = await repo.createItem(item: listItem);
      logger.d('Added $refId');
    } else {
      final newListItem = listItem.copyWith(
        name: name,
        info: info ?? '',
        urls: urls,
        categories: categories,
        datetime: datetime,
        address: address,
        latLong: latLong,
        searchPhrase: searchPhrase,
      );
      final refId =
          await repo.updateItem(itemId: newListItem.id!, item: newListItem);
      logger.d('Updated $refId');
    }
    router.pop();
  }

  String? nullIfEmpty(String? s) {
    if (s == null) return null;
    if (s.trim().isEmpty) return null;
    return s;
  }

  Future<GeocoderResult?> addSearchLocation(
    BuildContext context,
    String? searchPhrase,
    String publicListId,
    String listItemId,
  ) async {
    return SearchLocationForAddPageRoute(
      searchPhrase: searchPhrase,
      publicListId: publicListId,
      listItemId: listItemId,
    ).push<GeocoderResult?>(context);
  }

  Future<GeocoderResult?> editSearchLocation(
    BuildContext context,
    String? searchPhrase,
    String publicListId,
    String listItemId,
  ) async {
    return SearchLocationForEditPageRoute(
      searchPhrase: searchPhrase,
      publicListId: publicListId,
      listItemId: listItemId,
    ).push<GeocoderResult?>(context);
  }

  String getValueOrEmptyString(dynamic value) {
    if (value == null) return '';
    return '$value';
  }

  Future<void> deleteListItem(
    WidgetRef ref,
    GoRouter router,
    String publicListId,
    String listItemId,
  ) async {
    final repo =
        await ref.read(listItemsRepositoryProvider(publicListId).future);
    await repo.deleteItem(itemId: listItemId);
    router.pop();
  }

  DateFormat getDateFormatter(CurrentUser? firestoreUser, ListOfThings list) {
    if (list.withTimes) {
      return firestoreUser?.settings.dateFormatType == DateFormatType.ISO_8601
          ? dateTimeFormatter
          : DateFormat.yMd().add_jm();
    } else {
      return firestoreUser?.settings.dateFormatType == DateFormatType.ISO_8601
          ? dateFormatter
          : usDateFormatter;
    }
  }
}
