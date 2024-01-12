import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/pages/lists/models/list_of_things.dart';
import 'package:listwhatever/standard/appUi/theme/app_theme.dart';

import '/custom/pages/listItems/list_or_list_item_not_loaded_handler.dart';
import '/custom/pages/lists/list_events/list_bloc.dart';
import '/custom/pages/lists/list_events/list_event.dart';
import '/custom/pages/lists/list_events/list_state.dart';
import '/custom/pages/lists/lists_events/lists_bloc.dart';
import '/custom/pages/lists/lists_events/lists_event.dart';
import '/standard/constants.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import '/standard/widgets/vStack/v_stack.dart';
import '../models/list_type.dart';

enum AddListValues {
  id,
  name,
  type,
  withMap,
  withDates,
  withTimes,
  ownerId,
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
  late Map<String, dynamic> initialValue;

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
      final listState = context.watch<ListBloc>().state;

      final listStateView = ListOrListItemNotLoadedHandler.handleListState(listState);
      if (listStateView != null) {
        return listStateView;
      }
      list = (listState as ListLoaded).list;
    }

    initialValue = {
      AddListValues.id.toString(): list?.id,
      AddListValues.name.toString(): list?.name,
      AddListValues.type.toString(): list?.listType ?? ListType.other,
      AddListValues.withMap.toString(): list?.withMap ?? false,
      AddListValues.withDates.toString(): list?.withDates ?? false,
      AddListValues.withTimes.toString(): list?.withTimes ?? false,
      AddListValues.ownerId.toString(): list?.ownerId,
      // AddListValues.share.toString(): list?.shared ?? false,
    };
    return Scaffold(
      appBar: const CommonAppBar(title: 'Add list'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: FormBuilder(
            key: _formKey,
            onChanged: () {
              _formKey.currentState!.save();
              // logger.d(_formKey.currentState!.value.toString());
            },
            autovalidateMode: AutovalidateMode.disabled,
            initialValue: initialValue,
            skipDisabled: true,
            child: VStack(
              children: <Widget>[
                const SizedBox(height: 15),
                getListNameField(),
                getListTypeField(),
                getWithMapCheckbox(),
                getWithDatesCheckbox(),
                getWithTimesCheckbox(),
                Row(
                  children: <Widget>[
                    getCancelButton(),
                    const SizedBox(width: 20),
                    getSubmitButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FormBuilderTextField getListNameField() {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.always,
      name: AddListValues.name.toString(),
      decoration: InputDecoration(
        labelText: 'List name',
        suffixIcon:
            _nameHasError ? const Icon(Icons.error, color: Colors.red) : const Icon(Icons.check, color: Colors.green),
      ),
      onChanged: (val) {
        setState(() {
          _nameHasError = !(_formKey.currentState?.fields[AddListValues.name.toString()]?.validate() ?? false);
        });
      },
      // valueTransformer: (text) => num.tryParse(text),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.max(70),
      ]),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }

  Widget getListTypeField() {
    return FormBuilderDropdown<ListType>(
      name: AddListValues.type.toString(),
      decoration: InputDecoration(
        labelText: 'Type',
        suffix: _typeHasError ? const Icon(Icons.error) : const Icon(Icons.check),
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
          _typeHasError = !(_formKey.currentState?.fields[AddListValues.type.toString()]?.validate() ?? false);
        });
      },
      valueTransformer: (val) => val?.toString(),
    );
  }

  Widget getWithMapCheckbox() {
    return AppTheme.getCheckbox(AddListValues.withMap.toString(), 'With Map', _onChanged);
  }

  Widget getWithDatesCheckbox() {
    return AppTheme.getCheckbox(AddListValues.withDates.toString(), 'With Dates', _onChanged);
  }

  Widget getWithTimesCheckbox() {
    return AppTheme.getCheckbox(AddListValues.withTimes.toString(), 'With Times', _onChanged);
  }

  Widget getCancelButton() {
    return Expanded(
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
    );
  }

  Widget getSubmitButton() {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.saveAndValidate() ?? false) {
            // logger.d(_formKey.currentState?.value.toString());
            save(_formKey.currentState);
          } else {
            logger
              ..d(_formKey.currentState?.value.toString())
              ..d('validation failed');
          }
        },
        child: const Text(
          'Save',
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
      id: initialValue[AddListValues.id.toString()] as String?,
      name: values[AddListValues.name.toString()]! as String,
      listType: values[AddListValues.type.toString()] as ListType,
      withMap: values[AddListValues.withMap.toString()] as bool,
      withDates: values[AddListValues.withDates.toString()] as bool,
      withTimes: values[AddListValues.withTimes.toString()] as bool,
      shared: false, //values[AddListValues.share.toString()] as bool,
      shareCodeForViewer: null,
      shareCodeForEditor: null,
      sharedWith: {},
      ownerId: initialValue[AddListValues.ownerId.toString()] as String?,
    );
    if (widget.listId == null) {
      BlocProvider.of<ListsBloc>(context).add(AddList(list));
    } else {
      BlocProvider.of<ListBloc>(context).add(UpdateList(list));
    }
    GoRouter.of(context).pop();
  }
}
