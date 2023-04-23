import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/constants.dart';
import 'package:listanything/app/geocoder/geocoder.dart';
import 'package:listanything/app/geocoder/geocoderresult.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/pages/map/searchLocation/selected_address_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';

class SearchLocationPage extends ConsumerWidget {
  const SearchLocationPage(this.searchPhrase, {super.key, required this.publicListId, required this.listItemId});
  final String? searchPhrase;
  final String publicListId;
  final String? listItemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AddEditListItemInner(publicListId: publicListId, searchPhrase: searchPhrase, listItemId: listItemId);
  }
}

class AddEditListItemInner extends ConsumerStatefulWidget {
  const AddEditListItemInner({Key? key, required this.publicListId, this.searchPhrase, required this.listItemId})
      : super(key: key);
  final String publicListId;
  final String? searchPhrase;
  final String? listItemId;

  @override
  ConsumerState<AddEditListItemInner> createState() {
    return _AddEditListItemInnerState();
  }
}

const searchPhraseName = 'searchPhrase';
const addressSelectionName = 'addressSelection';

class _AddEditListItemInnerState extends ConsumerState<AddEditListItemInner> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  List<GeocoderResult>? addresses;
  bool _addressHasError = false;
  GeocoderResult? selectedAddress;
  Map<String, dynamic> initialValue = <String, dynamic>{};
  late final MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    print('In SearchLocationPage');
    initialValue = <String, dynamic>{searchPhraseName: widget.searchPhrase ?? ''};

    return CommonScaffold(
      title: 'Search for location',
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                onChanged: () {
                  _formKey.currentState!.save();
                  // debugPrint(_formKey.currentState!.value.toString());
                },
                autovalidateMode: AutovalidateMode.disabled,
                skipDisabled: true,
                initialValue: initialValue,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Flexible(
                          child: FormBuilderTextField(
                            autovalidateMode: AutovalidateMode.always,
                            name: searchPhraseName,
                            decoration: InputDecoration(
                              labelText: 'Search phrase',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _formKey.currentState!.fields[searchPhraseName]!.didChange('');
                                  });
                                },
                                icon: const Icon(Icons.close),
                              ),
                            ),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () async {
                            final searchPhrase = _formKey.currentState!.fields[searchPhraseName]!.value as String;
                            setState(() {
                              addresses = null;
                            });
                            final results = await Geocoder.getDataFromAddress(
                              address: searchPhrase,
                              googleMapApiKey: getMapsApiKey(),
                            );
                            print('search results: $results');
                            setState(() {
                              addresses = results ?? [];
                              selectedAddress = results?.first;
                            });
                          },
                          child: const Text('Search'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    if (addresses == null)
                      const Text('Loading...')
                    else
                      (addresses!.isEmpty)
                          ? const Text('No search results ')
                          : FormBuilderDropdown<GeocoderResult>(
                              name: addressSelectionName,
                              initialValue: addresses![0],
                              decoration: InputDecoration(
                                labelText: 'Address',
                                suffix: _addressHasError ? const Icon(Icons.error) : null,
                                hintText: 'Select address',
                              ),
                              validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required()],
                              ),
                              items: addresses!
                                  .map(
                                    (address) => DropdownMenuItem<GeocoderResult>(
                                      alignment: AlignmentDirectional.center,
                                      value: address,
                                      child: Text(address.formattedAddress),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  _addressHasError =
                                      !(_formKey.currentState?.fields[addressSelectionName]?.validate() ?? false);
                                  selectedAddress =
                                      _formKey.currentState?.fields[addressSelectionName]?.value as GeocoderResult?;

                                  mapController.move(
                                    selectedAddress!.geometry.location.toLatLng(),
                                    14.5,
                                  );
                                });
                              },
                              valueTransformer: (val) => val?.toString(),
                            ),
                    if (selectedAddress != null) ...[
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: FlutterMap(
                          mapController: mapController,
                          options: MapOptions(
                            center: selectedAddress!.geometry.location.toLatLng(),
                            zoom: 14.5,
                            interactiveFlags: InteractiveFlag.all - InteractiveFlag.rotate,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: selectedAddress!.geometry.location.toLatLng(),
                                  builder: (context) => const Icon(
                                    Icons.circle,
                                    color: Colors.red,
                                    size: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text('Address: ${selectedAddress!.formattedAddress}'),
                      Text('LatLong: ${selectedAddress!.geometry.location}'),
                    ]
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
                        GoRouter.of(context).pop();
                      },
                      // color: Theme.of(context).colorScheme.secondary,
                      child: const Text(
                        'Skip',
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedAddress == null) {
                          return;
                        }
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          // debugPrint(_formKey.currentState?.value.toString());
                          final searchPhrase = _formKey.currentState?.fields[searchPhraseName]?.value as String?;
                          saveAddress(
                            GoRouter.of(context),
                            selectedAddress!,
                            searchPhrase,
                            widget.publicListId,
                            widget.listItemId,
                          );
                        } else {
                          // debugPrint(_formKey.currentState?.value.toString());
                          debugPrint('validation failed');
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

  Future<void> saveAddress(
    GoRouter router,
    GeocoderResult result,
    String? searchPhrase,
    String publicListId,
    String? listItemId,
  ) async {
    ref.read(selectedAddressProvider.notifier).state =
        result.copyWith(searchPhrase: searchPhrase ?? 'No search phrase');

    router.pop();
  }
}
