import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/list_repository_provider.dart';
import 'package:listanything/app/pages/lists/selected_list_provider.dart';

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

class AddEditList extends ConsumerStatefulWidget {
  const AddEditList({Key? key}) : super(key: key);

  @override
  ConsumerState<AddEditList> createState() {
    return _AddEditListState();
  }
}

class _AddEditListState extends ConsumerState<AddEditList> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _nameHasError = true;
  bool _typeHasError = false;

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(selectedListProvider);
    final initialValue = list != null
        ? <String, dynamic>{'name': list.name, 'type': list.type}
        : <String, dynamic>{'name': '', 'type': ListType.other};

    return Scaffold(
      appBar: AppBar(title: const Text('Add List')),
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
                  debugPrint(_formKey.currentState!.value.toString());
                },
                autovalidateMode: AutovalidateMode.disabled,
                skipDisabled: true,
                initialValue: initialValue,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 15),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'name',
                      decoration: InputDecoration(
                        labelText: 'List name',
                        suffixIcon: _nameHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _nameHasError = !(_formKey.currentState?.fields['name']?.validate() ?? false);
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxLength(16),
                      ]),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderDropdown<ListType>(
                      name: 'type',
                      decoration: InputDecoration(
                        labelText: 'List type',
                        suffix: _typeHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
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
                              child: Text(type.name),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _typeHasError = !(_formKey.currentState?.fields['type']?.validate() ?? false);
                        });
                      },
                      valueTransformer: (val) => val?.toString(),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          debugPrint(_formKey.currentState?.value.toString());
                          saveList(GoRouter.of(context), list);
                        } else {
                          debugPrint(_formKey.currentState?.value.toString());
                          debugPrint('validation failed');
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveList(GoRouter router, ListOfThings? list) async {
    final fields = _formKey.currentState!.fields;
    final repo = await ref.read(listRepositoryProvider.future);
    final name = fields['name']!.value as String;
    final type = fields['type']!.value as ListType;
    if (list == null) {
      print('adding');
      final list = ListOfThings(name: name, type: type);
      final refId = await repo.createList(list: list);
      print('Added $refId');
    } else {
      final newList = list.copyWith(name: name, type: type);
      final refId = await repo.updateList(list: newList);
      print('Updated $refId');
      ref.read(selectedListProvider.notifier).state = null;
    }
    router.pop();
  }
}
