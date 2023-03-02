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
import 'package:listanything/app/navigation/routes/add_or_edit_list_item_route.dart';
import 'package:listanything/app/navigation/routes/routes.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/selected_list_item_provider.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/selected_list_provider.dart';
import 'package:listanything/app/pages/map/searchLocation/selected_address_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/double_async_value_widget.dart';

class SearchLocationPage extends ConsumerWidget {
  const SearchLocationPage(this.searchPhrase, {super.key});
  final String? searchPhrase;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DoubleAsyncValueWidget<ListItem?, ListOfThings?>(
      firstValue: ref.watch(selectedListItemProvider),
      secondValue: ref.watch(selectedListProvider),
      data: (listItem, list) => AddEditListItemInner(listItem: listItem, list: list, searchPhrase: searchPhrase),
    );
  }
}

class AddEditListItemInner extends ConsumerStatefulWidget {
  const AddEditListItemInner({Key? key, required this.listItem, required this.list, this.searchPhrase})
      : super(key: key);
  final ListItem? listItem;
  final ListOfThings? list;
  final String? searchPhrase;

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

    return Scaffold(
      appBar: AppBar(title: const Text('Search for location')),
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
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () async {
                              final searchPhrase = _formKey.currentState!.fields[searchPhraseName]!.value as String;
                              setState(() {
                                addresses = null;
                              });
                              final results = await Geocoder.getDataFromAddress(
                                address: searchPhrase,
                                googleMapApiKey: getMapsApiKey(),
                              );
                              print(results);
                              setState(() {
                                addresses = results ?? [];
                                selectedAddress = results?[0];
                              });
                            },
                            child: const Text('Search'),
                          ),
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
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(selectedAddress == null ? Colors.grey : null),
                      ),
                      onPressed: () {
                        if (selectedAddress == null) {
                          return;
                        }
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          debugPrint(_formKey.currentState?.value.toString());
                          final searchPhrase = _formKey.currentState?.fields[searchPhraseName]?.value as String?;
                          saveAddress(GoRouter.of(context), selectedAddress!, searchPhrase);
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
                        const AddOrEditListItemRoute().push(context);
                      },
                      // color: Theme.of(context).colorScheme.secondary,
                      child: Text(
                        'Skip',
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

  Future<void> saveAddress(GoRouter router, GeocoderResult result, String? searchPhrase) async {
    ref.read(selectedAddressProvider.notifier).state =
        result.copyWith(searchPhrase: searchPhrase ?? 'No search phrase');
    const AddOrEditListItemRoute().push(context);
  }
}
