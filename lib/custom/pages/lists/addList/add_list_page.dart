import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/custom/firestore/listItems/list_or_list_item_not_loaded_handler.dart';
import 'package:listanything/custom/firestore/lists/lists.dart';
import 'package:listanything/standard/constants.dart';
import 'package:listanything/standard/widgets/appBar/common_app_bar.dart';
import 'package:listanything/standard/widgets/vStack/v_stack.dart';

enum AddListValues {
  name,
  type,
  withMap,
  withDates,
  withTimes,
  // share
}

class AddListPage extends StatefulWidget {
  const AddListPage({super.key, this.listId});
  final String? listId;

  @override
  State<AddListPage> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _nameHasError = false;
  bool _typeHasError = false;

  final _typeOptions = ListType.values;

  void _onChanged(dynamic val) => logger.d(val.toString());

  @override
  void initState() {
    if (widget.listId != null) {
      BlocProvider.of<ListBloc>(context).add(LoadList(widget.listId!));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListOfThings? list;
    if (widget.listId != null) {
      final listState = context
          .watch<ListBloc>()
          .state;

      final listStateView = ListOrListItemNotLoadedHandler.handleListState(listState);
      if (listStateView != null) {
        return listStateView;
      }
      list = (listState as ListLoaded).list;
    }

    final initialValue = {
      AddListValues.name.toString(): list?.name,
      AddListValues.type.toString(): list?.listType ?? ListType.other,
      AddListValues.withMap.toString(): list?.withMap ?? false,
      AddListValues.withDates.toString(): list?.withDates ?? false,
      AddListValues.withTimes.toString(): list?.withTimes ?? false,
      // AddListValues.share.toString(): list?.shared ?? false,
    };
    return Scaffold(
      appBar: const CommonAppBar(title: 'Add list'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                onChanged: () {
                  _formKey.currentState!.save();
                  // logger.d(_formKey.currentState!.value.toString());
                },
                autovalidateMode: AutovalidateMode.disabled,
                initialValue:  initialValue,
                skipDisabled: true,
                child: VStack(
                  children: <Widget>[
                    const SizedBox(height: 15),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: AddListValues.name.toString(),
                      decoration: InputDecoration(
                        labelText: 'List name',
                        suffixIcon: _nameHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _nameHasError = !(_formKey
                                  .currentState?.fields[AddListValues.name.toString()]
                                  ?.validate() ??
                              false);
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.max(70),
                      ]),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderDropdown<ListType>(
                      name: AddListValues.type.toString(),
                      decoration: InputDecoration(
                        labelText: 'Type',
                        suffix: _typeHasError
                            ? const Icon(Icons.error)
                            : const Icon(Icons.check),
                        hintText: 'Select Type',
                      ),
                      validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()],
                      ),
                      items: _typeOptions
                          .map(
                            (type) => DropdownMenuItem(
                              alignment: AlignmentDirectional.center,
                              value: type,
                              child: Text(type.readable()),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _typeHasError = !(_formKey
                                  .currentState?.fields[AddListValues.type.toString()]
                                  ?.validate() ??
                              false);
                        });
                      },
                      valueTransformer: (val) => val?.toString(),
                    ),
                    // FormBuilderCheckbox(
                    //   name: AddListValues.share.toString(),
                    //   onChanged: _onChanged,
                    //   title: const Text('Share list'),
                    // ),
                    FormBuilderCheckbox(
                      name: AddListValues.withMap.toString(),
                      onChanged: _onChanged,
                      title: const Text('With Map'),
                    ),
                    FormBuilderCheckbox(
                      name: AddListValues.withDates.toString(),
                      onChanged: _onChanged,
                      title: const Text('With Dates'),
                    ),
                    FormBuilderCheckbox(
                      name: AddListValues.withTimes.toString(),
                      onChanged: _onChanged,
                      title: const Text('With Times'),
                    ),
                  ],
                ),
              ),
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
                          // logger.d(_formKey.currentState?.value.toString());
                          save(_formKey.currentState);
                        } else {
                          logger..d(_formKey.currentState?.value.toString())
                          ..d('validation failed');
                        }
                      },
                      child: const Text(
                        'Save',
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

  void save(FormBuilderState? currentState) {
    final values = <String, dynamic>{};
    for (final entry in currentState!.fields.entries) {
      values[entry.key] = entry.value.value;
    }
    // logger.d('values: $values');
    final list = ListOfThings(
      id: widget.listId,
      name: values[AddListValues.name.toString()]! as String,
      listType: values[AddListValues.type.toString()] as ListType,
      withMap: values[AddListValues.withMap.toString()] as bool,
      withDates: values[AddListValues.withDates.toString()] as bool,
      withTimes: values[AddListValues.withTimes.toString()] as bool,
      shared: false, //values[AddListValues.share.toString()] as bool,
      shareCodeForViewer: null,
      shareCodeForEditor: null,
      sharedWith: {},
      ownerId: null,
    );
    if (widget.listId == null) {
      BlocProvider.of<ListsBloc>(context).add(AddList(list));
    } else {
      BlocProvider.of<ListBloc>(context).add(UpdateList(list));
    }
    GoRouter.of(context).pop();
  }
}
