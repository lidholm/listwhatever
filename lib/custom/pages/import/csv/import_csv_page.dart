import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/pages/listItems/list_item_crud_bloc/list_item_crud_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/list_item_crud_bloc/list_item_crud_event.dart';
import 'package:listwhatever/custom/pages/listItems/list_item_crud_bloc/list_item_crud_state.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_event.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_state.dart';
import '/custom/pages/import/csv/convert_csv_to_list_items.dart';
import '/custom/pages/listItems/list_item.dart';
import '/custom/pages/listItems/list_or_list_item_not_loaded_handler.dart';
import '/standard/constants.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import '/standard/widgets/vStack/v_stack.dart';

enum ImportCsvValues {
  csv,
}

class ImportCsvPage extends StatefulWidget {
  const ImportCsvPage({required this.listId, super.key});

  final String listId;

  @override
  State<ImportCsvPage> createState() => _ImportCsvPageState();
}

class _ImportCsvPageState extends State<ImportCsvPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _csvHasError = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListItemsLoadBloc>(context).add(LoadListItems(widget.listId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ListItemCrudBloc, ListItemCrudState>(
      listener: (context, state) {
        logger.i('$this => state: $state');
        if (state is ListItemCrudImported) {
          GoRouter.of(context).pop();
        }
      },
      child: BlocBuilder<ListItemsLoadBloc, ListItemsLoadState>(
        builder: (listItemsContext, listItemsState) {
          final listItemsView = ListOrListItemNotLoadedHandler.handleListItemsState(listItemsState);
          if (listItemsView != null) {
            return listItemsView;
          }
          final listItems = (listItemsState as ListItemsLoadLoaded).listItems;

          return Scaffold(
            appBar: const CommonAppBar(
              title: 'Import from CSV',
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: createForm(
                  [
                    createDescription(),
                    createCsvField(),
                    const SizedBox(height: 40),
                    Row(
                      children: <Widget>[
                        createResetButton(context),
                        const SizedBox(width: 20),
                        createSaveButton(widget.listId, listItems),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  FormBuilder createForm(List<Widget> children) {
    final initialValue = {
      ImportCsvValues.csv.toString(): '',
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
      child: VStack(children: children),
    );
  }

  Text createDescription() {
    return const Text('Warning: Will overwrite existing items with the same name!! .\n'
        'Csv file with first row being the names of the headers.\n'
        "'name', 'info', 'lat', 'long', 'urls', 'address' are reserved header names that will be mapped to fields of the ListItems\n"
        'Any other header names will be name for categories\n'
        "For 'urls' and 'categories', values can be comma separated");
  }

  FormBuilderTextField createCsvField() {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.always,
      minLines: 3,
      maxLines: 6,
      name: ImportCsvValues.csv.name,
      decoration: InputDecoration(
        labelText: 'Paste CSV here',
        suffixIcon:
            _csvHasError ? const Icon(Icons.error, color: Colors.red) : const Icon(Icons.check, color: Colors.green),
      ),
      onChanged: (val) {
        setState(() {
          _csvHasError = !(_formKey.currentState?.fields[ImportCsvValues.csv.toString()]?.validate() ?? false);
        });
      },
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.max(5000),
      ]),
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
    );
  }

  Expanded createSaveButton(String listId, List<ListItem> listItems) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.saveAndValidate() ?? false) {
            // logger.d(_formKey.currentState?.value.toString());
            save(listId, listItems, _formKey.currentState);
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

  Divider createDivider() {
    return const Divider(
      height: 20,
      thickness: 5,
      indent: 20,
      endIndent: 0,
      color: Colors.black,
    );
  }

  void save(String listId, List<ListItem> originalListItems, FormBuilderState? currentState) {
    final values = <String, dynamic>{};
    for (final entry in currentState!.fields.entries) {
      values[entry.key] = entry.value.value;
    }

    logger.d('values: $values');
    final csv = values[ImportCsvValues.csv.name] as String;

    logger.d('csv: $csv');

    final listItems = CsvConverter().convert(csv);
    logger.d('listItems: $listItems');

    BlocProvider.of<ListItemCrudBloc>(context).add(ImportListItems(listId, listItems));
  }
}
