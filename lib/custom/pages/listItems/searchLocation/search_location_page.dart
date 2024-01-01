import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:allmylists/custom/pages/listItems/searchLocation/geocoder/geocoderresult.dart';
import 'package:allmylists/custom/pages/listItems/searchLocation/search_location_bloc.dart';
import 'package:allmylists/custom/pages/listItems/searchLocation/search_location_event.dart';
import 'package:allmylists/custom/pages/listItems/searchLocation/search_location_response.dart';
import 'package:allmylists/custom/pages/listItems/searchLocation/search_location_state.dart';
import 'package:allmylists/l10n/l10n.dart';
import 'package:allmylists/standard/constants.dart';
import 'package:allmylists/standard/widgets/appBar/common_app_bar.dart';
import 'package:allmylists/standard/widgets/vStack/v_stack.dart';

enum SearchLocationValues { searchPhrase, results, address, latlong }

class SearchLocationPage extends StatefulWidget {
  const SearchLocationPage({super.key});

  @override
  State<SearchLocationPage> createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _searchHasError = false;
  bool _resultsHasError = false;
  bool _addressHasError = false;
  bool _latlongHasError = false;
  GoogleMapController? mapController;

  GeocoderResult? selectedResult;

  Map<String, dynamic> initialValues = {
    SearchLocationValues.searchPhrase.toString(): null,
    SearchLocationValues.results.toString(): null,
    SearchLocationValues.address.toString(): null,
    SearchLocationValues.latlong.toString(): null,
  };

  @override
  void initState() {
    super.initState();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 10.4746,
  );

  // ignore: use_setters_to_change_properties
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final searchState = context.watch<SearchLocationBloc>().state;
    final searchResults = (searchState is SearchLoaded) ? searchState.lists : <GeocoderResult>[];

    return Scaffold(
      appBar: const CommonAppBar(title: 'Search location'),
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
                initialValue: initialValues,
                skipDisabled: true,
                child: VStack(
                  children: <Widget>[
                    const SizedBox(height: 15),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: SearchLocationValues.searchPhrase.toString(),
                      decoration: InputDecoration(
                        labelText: 'Search',
                        suffixIcon: _searchHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _searchHasError = !(_formKey
                                  .currentState?.fields[SearchLocationValues.searchPhrase.toString()]
                                  ?.validate() ??
                              false);
                        });
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.max(150),
                      ]),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final phrase = _formKey
                            .currentState?.fields[SearchLocationValues.searchPhrase.toString()]?.value as String;
                        BlocProvider.of<SearchLocationBloc>(context).add(Search(phrase));
                      },
                      child: Text(context.l10n.searchButtonText),
                    ),
                    FormBuilderDropdown<GeocoderResult>(
                      name: SearchLocationValues.results.toString(),
                      decoration: InputDecoration(
                        labelText: 'Results',
                        suffix: _resultsHasError ? const Icon(Icons.error) : const Icon(Icons.check),
                        hintText: 'Select result',
                      ),
                      validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()],
                      ),
                      items: (searchResults ?? [])
                          .map(
                            (result) => DropdownMenuItem(
                              alignment: AlignmentDirectional.center,
                              value: result,
                              child: Text(result.formattedAddress),
                              onTap: () async {
                                await moveMap(mapController, result);
                                setState(() {
                                  selectedResult = result;
                                });
                                _formKey.currentState?.patchValue({
                                  SearchLocationValues.address.toString(): result.formattedAddress,
                                  SearchLocationValues.latlong.toString():
                                      '${result.geometry.location.lat}, ${result.geometry.location.lng}',
                                });
                              },
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _resultsHasError =
                              !(_formKey.currentState?.fields[SearchLocationValues.results.toString()]?.validate() ??
                                  false);
                        });
                      },
                      valueTransformer: (val) => val?.toString(),
                    ),
                    SizedBox(
                      height: 300,
                      width: 400,
                      child: GoogleMap(
                        mapType: MapType.hybrid,
                        initialCameraPosition: _kGooglePlex,
                        markers: _createMarker(selectedResult),
                        onMapCreated: _onMapCreated,
                      ),
                    ),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: SearchLocationValues.address.toString(),
                      decoration: InputDecoration(
                        labelText: 'Address',
                        suffixIcon: _addressHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _addressHasError =
                              !(_formKey.currentState?.fields[SearchLocationValues.address.toString()]?.validate() ??
                                  false);
                        });
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.max(150),
                      ]),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: SearchLocationValues.latlong.toString(),
                      decoration: InputDecoration(
                        labelText: 'LatLong',
                        suffixIcon: _latlongHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _latlongHasError =
                              !(_formKey.currentState?.fields[SearchLocationValues.latlong.toString()]?.validate() ??
                                  false);
                        });
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.match(r'\d*(\.\d*)?,\s*-?\d*(\.\d*)',
                            errorText: "Doesn't match 12.3, 3.45",),
                      ]),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              _formKey.currentState?.reset();
                            },
                            child: Text(
                              'Cancel',
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
                                closeAndReturnValues(_formKey.currentState);
                              } else {
                                logger..d(_formKey.currentState?.value.toString())
                                ..d('validation failed');
                              }
                            },
                            child: const Text(
                              'Ok',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void closeAndReturnValues(FormBuilderState? currentState) {
    final values = <String, dynamic>{};
    for (final entry in currentState!.fields.entries) {
      values[entry.key] = entry.value.value;
    }
    // logger.d('values: $values');
    final latLongString = values[SearchLocationValues.latlong.toString()]! as String;
    final latLongParts = latLongString.split(',');
    final lat = double.parse(latLongParts.first.trim());
    final lng = double.parse(latLongParts.last.trim());

    final response = SearchLocationResponse(
      address: values[SearchLocationValues.address.toString()]! as String,
      lat: lat,
      long: lng,
      searchPhrase: values[SearchLocationValues.searchPhrase.toString()]! as String,
    );
    GoRouter.of(context).pop(response);
  }

  Set<Marker> _createMarker(GeocoderResult? result) {
    if (result == null) return Set.of({});

    return Set.of({
      Marker(
        markerId: MarkerId(result.formattedAddress),
        position: LatLng(
          result.geometry.location.lat,
          result.geometry.location.lng,
        ),
      ),
    });
  }

  Future<void> moveMap(
    GoogleMapController? mapController,
    GeocoderResult result,
  ) async {
    if (mapController == null) {
      return;
    }

    const cameraBuffer = 0.01;

    await mapController.moveCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(
            result.geometry.location.lat - cameraBuffer,
            result.geometry.location.lng - cameraBuffer,
          ),
          northeast: LatLng(
            result.geometry.location.lat + cameraBuffer,
            result.geometry.location.lng + cameraBuffer,
          ),
        ),
        18,
      ),
    );
  }
}
