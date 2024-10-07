import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/standard/form/form_generator.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:listwhatever/standard/form/form_input_section.dart';
import '/custom/pages/listItems/searchLocation/geocoder/geocoderresult.dart';
import '/custom/pages/listItems/searchLocation/search_location_bloc.dart';
import '/custom/pages/listItems/searchLocation/search_location_event.dart';
import '/custom/pages/listItems/searchLocation/search_location_response.dart';
import '/custom/pages/listItems/searchLocation/search_location_state.dart';
import '/standard/constants.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import '/standard/widgets/vStack/x_stack.dart' as x_stack;

const String className = 'AddListItemPage';

enum SectionName {
  search._('search'),
  info._('info'),
  submit._('submit');

  const SectionName._(this.value);

  final String value;
}

enum FieldId {
  searchPhrase._('searchPhrase'),
  results._('results'),
  map._('map'),
  address._('address'),
  latlong._('latlong'),
  cancel._('cancel'),
  submit._('submit');

  const FieldId._(this.value);

  final String value;
}

class SearchLocationPage extends StatefulWidget {
  const SearchLocationPage({super.key});

  @override
  State<SearchLocationPage> createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  GeocoderResult? selectedResult;
  final TextEditingController searchPhraseController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = context.watch<SearchLocationBloc>().state;
    final searchResults = (searchState is SearchLoaded)
        ? searchState.lists ?? []
        : <GeocoderResult>[];

    // print('searchResults');
    // print(searchResults);
    final fields = [
      searchPhraseInputField(),
      searchButtonInputField(),
      resultsDropdownField(searchResults),
      // mapInputField(),
      addressInputField(),
      latLongInputField(),
      cancelButton(),
      submitButton(),
    ];
    print('fields: ${fields.length}');

    final sections = getSections();

    final formGenerator = FormGenerator(
      formKey: _formKey,
      sections: sections,
      fields: fields,
    );

    return searchResultsListener(
      Scaffold(
        appBar: const CommonAppBar(title: 'Search location'),
        body: SingleChildScrollView(
          child:
              Padding(padding: const EdgeInsets.all(24), child: formGenerator),
        ),
      ),
    );
  }

  List<FormInputSection> getSections() {
    return [
      FormInputSection(
        name: SectionName.search.value,
        direction: x_stack.AxisDirection.vertical,
        showBorder: false,
      ),
      FormInputSection(
        name: SectionName.info.value,
        direction: x_stack.AxisDirection.vertical,
        showBorder: false,
      ),
      FormInputSection(
        name: SectionName.submit.value,
        direction: x_stack.AxisDirection.vertical,
        showBorder: false,
      ),
    ];
  }

  FormInputFieldInfo searchPhraseInputField() {
    return FormInputFieldInfo.textArea(
      id: FieldId.searchPhrase.value,
      label: 'Search',
      controller: searchPhraseController,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(150),
      ],
      sectionName: SectionName.search.value,
      hasError: false,
    );
  }

  FormInputFieldInfo searchButtonInputField() {
    return FormInputFieldInfo.customButton(
      id: FieldId.submit.value,
      label: 'Search',
      sectionName: SectionName.search.value,
      callback: () {
        print('search');
        print(searchPhraseController);

        BlocProvider.of<SearchLocationBloc>(context)
            .add(Search(searchPhraseController.text));
      },
    );
  }

  FormInputFieldInfo resultsDropdownField(List<GeocoderResult> searchResults) {
    return FormInputFieldInfo.dropdown(
      id: FieldId.results.value,
      label: 'Search result',
      currentValue: searchResults.firstOrNull,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(70),
      ],
      options: searchResults,
      optionToString: (result) =>
          (result as GeocoderResult?)?.formattedAddress ?? '',
      sectionName: SectionName.info.value,
      hasError: false,
      onChange: (selection) => setState(() {
        logger.i('$className: onChange result: $selection');
        setState(() {
          final sel = selection as GeocoderResult?;
          _formKey.currentState?.patchValue({
            FieldId.address.name: sel?.formattedAddress ?? '',
            FieldId.latlong.name: sel == null
                ? ''
                : '${sel.geometry.location.lat}, ${sel.geometry.location.lng}',
          });
        });
      }),
    );
  }

  FormInputFieldInfo addressInputField() {
    return FormInputFieldInfo.textArea(
      id: FieldId.address.value,
      label: 'Address',
      currentValue: '',
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(150),
      ],
      sectionName: SectionName.info.value,
      hasError: false,
    );
  }

  FormInputFieldInfo latLongInputField() {
    return FormInputFieldInfo.textArea(
      id: FieldId.latlong.value,
      label: 'Coordinates',
      currentValue: '',
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.match(
          RegExp(r'\d*(\.\d*)?,\s*-?\d*(\.\d*)'),
          errorText: "Doesn't match 12.3, 3.45",
        ),
      ],
      sectionName: SectionName.info.value,
      hasError: false,
    );
  }

  // FormInputFieldInfo mapInputField() {
  //   return FormInputFieldInfo.map(
  //     id: FieldId.latlong.value,
  //     label: 'Map',
  //     sectionName: SectionName.info.value,
  //     marker: null,
  //   );
  // }

  FormInputFieldInfo cancelButton() {
    return FormInputFieldInfo.cancelButton(
      id: FieldId.cancel.value,
      label: 'Cancel',
      sectionName: SectionName.submit.value,
      cancel: () {
        print('cancelled');
      },
    );
  }

  FormInputFieldInfo submitButton() {
    return FormInputFieldInfo.submitButton(
      id: FieldId.submit.value,
      label: 'Submit',
      sectionName: SectionName.submit.value,
      save: (Map<String, dynamic>? values) {
        print('save');
        if (values == null) {
          print('No values to save');
          return;
        }
        closeAndReturnValues(values);
      },
    );
  }

  void closeAndReturnValues(Map<String, dynamic> values) {
    // logger.d('values: $values');
    final latLongString = values[FieldId.latlong.name]! as String;
    final latLongParts = latLongString.split(',');
    final lat = double.parse(latLongParts.first.trim());
    final lng = double.parse(latLongParts.last.trim());

    final response = SearchLocationResponse(
      address: values[FieldId.address.name]! as String,
      lat: lat,
      long: lng,
      searchPhrase: values[FieldId.searchPhrase.name]! as String,
    );
    GoRouter.of(context).pop(response);
  }

  Widget searchResultsListener(Scaffold child) {
    return BlocListener<SearchLocationBloc, SearchState>(
      listener: (context, state) {
        if (state is SearchLoaded) {
          final results = state.lists;

          _formKey.currentState?.patchValue({
            FieldId.address.name: results?.first.formattedAddress,
            FieldId.latlong.name:
                '${results?.first.geometry.location.lat}, ${results?.first.geometry.location.lng}',
          });
        }
      },
      child: child,
    );
  }
}
