import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:listwhatever/standard/form/form_generator.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:listwhatever/standard/form/form_input_section.dart';
import '/custom/pages/listItems/searchLocation/geocoder/geocoderresult.dart';
import '/custom/pages/listItems/searchLocation/search_location_bloc.dart';
import '/custom/pages/listItems/searchLocation/search_location_event.dart';
import '/custom/pages/listItems/searchLocation/search_location_response.dart';
import '/custom/pages/listItems/searchLocation/search_location_state.dart';
import '/l10n/l10n.dart';
import '/standard/constants.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import '/standard/widgets/vStack/v_stack.dart';
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
  TextEditingController addressController = TextEditingController(text: '');
  TextEditingController latLongController = TextEditingController(text: '');

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

    return Scaffold(
      appBar: const CommonAppBar(title: 'Search location'),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(24), child: formGenerator

            //         FormBuilderDropdown<GeocoderResult>(
            //           name: SearchLocationValues.results.toString(),
            //           decoration: InputDecoration(
            //             labelText: 'Results',
            //             suffix: _resultsHasError
            //                 ? const Icon(Icons.error)
            //                 : const Icon(Icons.check),
            //             hintText: 'Select result',
            //           ),
            //           // validator: FormBuilderValidators.compose(
            //           //     // [FormBuilderValidators.required()],
            //           //     ),
            //           items: (searchResults ?? [])
            //               .map(
            //                 (result) => DropdownMenuItem(
            //                   alignment: AlignmentDirectional.center,
            //                   value: result,
            //                   child: Text(result.formattedAddress),
            //                   onTap: () async {
            //                     await moveMap(mapController, result);
            //                     setState(() {
            //                       selectedResult = result;
            //                     });
            //                     _formKey.currentState?.patchValue({
            //                       SearchLocationValues.address.toString():
            //                           result.formattedAddress,
            //                       SearchLocationValues.latlong.toString():
            //                           '${result.geometry.location.lat}, ${result.geometry.location.lng}',
            //                     });
            //                   },
            //                 ),
            //               )
            //               .toList(),
            //           onChanged: (val) {
            //             setState(() {
            //               _resultsHasError = !(_formKey
            //                       .currentState
            //                       ?.fields[
            //                           SearchLocationValues.results.toString()]
            //                       ?.validate() ??
            //                   false);
            //             });
            //           },
            //           valueTransformer: (val) => val?.toString(),
            //         ),
            //         SizedBox(
            //           height: 300,
            //           width: 400,
            //           child: GoogleMap(
            //             mapType: MapType.hybrid,
            //             initialCameraPosition: _kGooglePlex,
            //             markers: _createMarker(selectedResult),
            //             onMapCreated: _onMapCreated,
            //           ),
            //         ),
            //         FormBuilderTextField(
            //           autovalidateMode: AutovalidateMode.always,
            //           name: SearchLocationValues.address.toString(),
            //           decoration: InputDecoration(
            //             labelText: 'Address',
            //             suffixIcon: _addressHasError
            //                 ? const Icon(Icons.error, color: Colors.red)
            //                 : const Icon(Icons.check, color: Colors.green),
            //           ),
            //           onChanged: (val) {
            //             setState(() {
            //               _addressHasError = !(_formKey
            //                       .currentState
            //                       ?.fields[
            //                           SearchLocationValues.address.toString()]
            //                       ?.validate() ??
            //                   false);
            //             });
            //           },
            //           validator: FormBuilderValidators.compose([
            //             FormBuilderValidators.required(),
            //             FormBuilderValidators.maxLength(150),
            //           ]),
            //           keyboardType: TextInputType.name,
            //           textInputAction: TextInputAction.next,
            //         ),
            //         FormBuilderTextField(
            //           autovalidateMode: AutovalidateMode.always,
            //           name: SearchLocationValues.latlong.toString(),
            //           decoration: InputDecoration(
            //             labelText: 'LatLong',
            //             suffixIcon: _latlongHasError
            //                 ? const Icon(Icons.error, color: Colors.red)
            //                 : const Icon(Icons.check, color: Colors.green),
            //           ),
            //           onChanged: (val) {
            //             setState(() {
            //               _latlongHasError = !(_formKey
            //                       .currentState
            //                       ?.fields[
            //                           SearchLocationValues.latlong.toString()]
            //                       ?.validate() ??
            //                   false);
            //             });
            //           },
            //           validator: FormBuilderValidators.compose([
            //             FormBuilderValidators.required(),
            //             FormBuilderValidators.match(
            //               RegExp(r'\d*(\.\d*)?,\s*-?\d*(\.\d*)'),
            //               errorText: "Doesn't match 12.3, 3.45",
            //             ),
            //           ]),
            //           keyboardType: TextInputType.name,
            //           textInputAction: TextInputAction.next,
            //         ),
            //         const SizedBox(height: 40),
            //         Row(
            //           children: <Widget>[
            //             Expanded(
            //               child: OutlinedButton(
            //                 onPressed: () {
            //                   _formKey.currentState?.reset();
            //                 },
            //                 child: Text(
            //                   'Cancel',
            //                   style: TextStyle(
            //                     color: Theme.of(context).colorScheme.secondary,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //             const SizedBox(width: 20),
            //             Expanded(
            //               child: ElevatedButton(
            //                 onPressed: () {
            //                   if (_formKey.currentState?.saveAndValidate() ??
            //                       false) {
            //                     // logger.d(_formKey.currentState?.value.toString());
            //                     closeAndReturnValues(_formKey.currentState);
            //                   } else {
            //                     logger
            //                       ..d(_formKey.currentState?.value.toString())
            //                       ..d('validation failed');
            //                   }
            //                 },
            //                 child: const Text(
            //                   'Ok',
            //                   style: TextStyle(color: Colors.white),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ],
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
          addressController =
              TextEditingController(text: sel?.formattedAddress ?? '');
          latLongController = TextEditingController(
              text: sel == null
                  ? ''
                  : '${sel?.geometry.location.lat}, ${sel?.geometry.location.lng}');
        });
      }),
    );
  }

  FormInputFieldInfo addressInputField() {
    logger.i('$className: addressXX: $addressController');

    return FormInputFieldInfo.textArea(
      id: FieldId.address.value,
      label: 'Address',
      controller: addressController,
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
      controller: latLongController,
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
}
