import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/common_theme_data.dart';
import 'package:listanything/app/firebase/current_user.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/navigation/current_user_provider.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/list_repository_provider.dart';
import 'package:listanything/app/pages/lists/lists_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/app_bar_action.dart';
import 'package:listanything/app/widgets/standardWidgets/async_value_widget.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';

extension ListTypeExtension on ListType {
  String get name {
    switch (this) {
      case ListType.restaurants:
        return 'Restaurants';
      case ListType.food:
        return 'Food';
      case ListType.activities:
        return 'Activities';
      case ListType.movies:
        return 'Movies';
      case ListType.other:
        return 'Other';
    }
  }

  String get value {
    switch (this) {
      case ListType.restaurants:
        return 'restaurants';
      case ListType.food:
        return 'food';
      case ListType.activities:
        return 'activities';
      case ListType.movies:
        return 'movies';
      case ListType.other:
        return 'other';
    }
  }
}

class AddEditList extends ConsumerWidget {
  const AddEditList({
    required this.publicListId,
    super.key,
  });
  final String? publicListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget<CurrentUser?>(
      value: ref.watch(currentUserProvider),
      data: (user) {
        if (publicListId == null) {
          return AddEditListInner(userId: user!.uid, list: null);
        }
        return AsyncValueWidget<ListOfThings?>(
          value: ref.watch(listProvider(publicListId!)),
          data: (list) => AddEditListInner(userId: user!.uid, list: list),
        );
      },
    );
  }
}

class AddEditListInner extends ConsumerStatefulWidget {
  const AddEditListInner({
    required this.userId,
    required this.list,
    super.key,
  });
  final String userId;
  final ListOfThings? list;

  @override
  ConsumerState<AddEditListInner> createState() {
    return _AddEditListInnerState();
  }
}

const nameFieldName = 'name';
const typeFieldName = 'type';
const withMapFieldName = 'withMap';
const withDatesFieldName = 'withDates';
const withTimesFieldName = 'withTimes';

class _AddEditListInnerState extends ConsumerState<AddEditListInner> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _nameHasError = false;
  bool _typeHasError = false;
  bool showTimesField = false;

  @override
  void initState() {
    super.initState();
    showTimesField = widget.list?.withDates ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final initialValue = widget.list != null
        ? <String, dynamic>{
            nameFieldName: widget.list!.name,
            typeFieldName: widget.list!.type,
            withMapFieldName: widget.list!.withMap,
            withDatesFieldName: widget.list!.withDates,
            withTimesFieldName: widget.list!.withTimes,
          }
        : <String, dynamic>{
            nameFieldName: '',
            typeFieldName: ListType.other,
            withMapFieldName: false,
            withDatesFieldName: false,
            withTimesFieldName: false,
          };

    return CommonScaffold(
      title: widget.list != null ? 'Edit List' : 'Add List',
      actions: [
        if (widget.list != null)
          AppBarAction(
            key: const Key('deletelist'),
            title: 'Delete list',
            icon: Icons.delete,
            callback: () =>
                deleteList(ref, GoRouter.of(context), widget.list!.id!),
            overflow: false,
          ),
      ],
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                // enabled: false,
                onChanged: () {
                  _formKey.currentState!.save();
                  logger.d(_formKey.currentState!.value.toString());
                },
                autovalidateMode: AutovalidateMode.disabled,
                skipDisabled: true,
                initialValue: initialValue,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: nameFieldName,
                      decoration: InputDecoration(
                        labelText: 'List name',
                        suffixIcon: _nameHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _nameHasError = !(_formKey
                                  .currentState?.fields[nameFieldName]
                                  ?.validate() ??
                              false);
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxLength(50),
                      ]),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    FormBuilderDropdown<ListType>(
                      name: typeFieldName,
                      decoration: InputDecoration(
                        labelText: 'List type',
                        suffix: _typeHasError
                            ? const Padding(
                                padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                child: Icon(Icons.error, color: Colors.red),
                              )
                            : const Padding(
                                padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                child: Icon(Icons.check, color: Colors.green),
                              ),
                        hintText: 'Select Type',
                      ),
                      validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()],
                      ),
                      items: ListType.values
                          .map(
                            (type) => DropdownMenuItem(
                              alignment: AlignmentDirectional.center,
                              value: type,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(type.name),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _typeHasError = !(_formKey
                                  .currentState?.fields[typeFieldName]
                                  ?.validate() ??
                              false);
                        });
                      },
                      valueTransformer: (val) => val?.toString(),
                    ),
                    const SizedBox(height: 16),
                    FormBuilderSwitch(
                      title: const Text('Show on map'),
                      name: withMapFieldName,
                      activeColor: mainColor,
                    ),
                    const SizedBox(height: 16),
                    FormBuilderSwitch(
                      title: const Text('Include dates for items'),
                      name: withDatesFieldName,
                      activeColor: mainColor,
                      onChanged: (value) {
                        setState(() {
                          showTimesField = value ?? false;
                        });
                      },
                    ),
                    if (showTimesField)
                      FormBuilderSwitch(
                        title: const Text('Include times for items'),
                        name: withTimesFieldName,
                        activeColor: mainColor,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _formKey.currentState?.reset();
                      },
                      // color: Theme.of(context).colorScheme.secondary,
                      child: Text(
                        'Reset',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          logger.d(_formKey.currentState?.value.toString());
                          saveList(
                            GoRouter.of(context),
                            widget.userId,
                            widget.list,
                          );
                        } else {
                          logger
                            ..d(_formKey.currentState?.value.toString())
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveList(
    GoRouter router,
    String userId,
    ListOfThings? list,
  ) async {
    final fields = _formKey.currentState!.fields;
    final name = fields[nameFieldName]!.value as String;
    final type = fields[typeFieldName]!.value as ListType;
    final withMap = fields[withMapFieldName]!.value as bool;
    final withDates = fields[withDatesFieldName]!.value as bool;
    final withTimes =
        withDates && (fields[withTimesFieldName]?.value as bool? ?? false);

    await ref.read(listRepositoryProvider).when(
          error: (e, st) {},
          loading: () {},
          data: (repo) async {
            if (list == null) {
              logger.d('adding');
              final list = ListOfThings(
                name: name,
                type: type,
                userId: userId,
                withMap: withMap,
                withDates: withDates,
                withTimes: withTimes,
                editors: {userId: true},
              );
              final refId = await repo.createItem(item: list);
              logger.d('Added $refId');
            } else {
              final newList = list.copyWith(
                name: name,
                type: type,
                withMap: withMap,
                withDates: withDates,
                withTimes: withTimes,
              );
              final refId =
                  await repo.updateItem(itemId: newList.id!, item: newList);
              logger.d('Updated $refId');
            }
            router.pop();
          },
        );
  }

  Future<void> deleteList(WidgetRef ref, GoRouter router, String listId) async {
    logger.d('delete');
    await ref.read(listRepositoryProvider).when(
          error: (e, st) {
            logger
              ..e(e)
              ..e(st);
          },
          loading: () {},
          data: (repo) async {
            await repo.deleteItem(itemId: listId);
            router.pop();
          },
        );
  }
}
