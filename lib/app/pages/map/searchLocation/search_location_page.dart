import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/api_keys.dart';
import 'package:listanything/app/geocoder/geocoder.dart';
import 'package:listanything/app/geocoder/geocoderresult.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';

const searchPhraseName = 'searchPhrase';
const addressSelectionName = 'addressSelection';

class SearchLocationPage extends HookWidget {
  const SearchLocationPage(
    this.searchPhrase, {
    required this.publicListId,
    required this.listItemId,
    super.key,
  });
  final String? searchPhrase;
  final String publicListId;
  final String? listItemId;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    final mapController = useState(MapController());
    final addresses = useState<List<GeocoderResult>?>([]);
    final selectedAddress = useState<GeocoderResult?>(null);
    final addressHasError = useState(false);

    logger.d('In SearchLocationPage');

    return CommonScaffold(
      title: 'Search for location',
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FormBuilder(
                key: formKey,
                onChanged: () {
                  formKey.currentState!.save();
                },
                autovalidateMode: AutovalidateMode.disabled,
                skipDisabled: true,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Flexible(
                          child: FormBuilderTextField(
                            autovalidateMode: AutovalidateMode.always,
                            name: searchPhraseName,
                            initialValue: searchPhrase ?? '',
                            decoration: InputDecoration(
                              labelText: 'Search phrase',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  formKey
                                      .currentState!.fields[searchPhraseName]!
                                      .didChange('');
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
                            final searchPhrase = formKey.currentState!
                                .fields[searchPhraseName]!.value as String;
                            addresses.value = null;
                            final results = await Geocoder.getDataFromAddress(
                              address: searchPhrase,
                              googleMapApiKey: getMapsApiKey(),
                            );
                            logger.d('search results: $results');
                            addresses.value = results ?? [];
                            selectedAddress.value = results?.first;
                          },
                          child: const Text('Search'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    if (addresses.value == null)
                      const Text('Loading...')
                    else
                      (addresses.value!.isEmpty)
                          ? const Text('No search results ')
                          : FormBuilderDropdown<GeocoderResult>(
                              name: addressSelectionName,
                              initialValue: addresses.value![0],
                              decoration: InputDecoration(
                                labelText: 'Address',
                                suffix: addressHasError.value
                                    ? const Icon(Icons.error)
                                    : null,
                                hintText: 'Select address',
                              ),
                              validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required()],
                              ),
                              items: addresses.value!
                                  .map(
                                    (address) =>
                                        DropdownMenuItem<GeocoderResult>(
                                      alignment: AlignmentDirectional.center,
                                      value: address,
                                      child: Text(address.formattedAddress),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) {
                                addressHasError.value = !(formKey.currentState
                                        ?.fields[addressSelectionName]
                                        ?.validate() ??
                                    false);
                                selectedAddress.value = formKey
                                    .currentState
                                    ?.fields[addressSelectionName]
                                    ?.value as GeocoderResult?;

                                mapController.value.move(
                                  selectedAddress.value!.geometry.location
                                      .toLatLng(),
                                  14.5,
                                );
                              },
                              valueTransformer: (val) => val?.toString(),
                            ),
                    if (selectedAddress.value != null) ...[
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: FlutterMap(
                          mapController: mapController.value,
                          options: MapOptions(
                            center: selectedAddress.value!.geometry.location
                                .toLatLng(),
                            zoom: 14.5,
                            interactiveFlags:
                                InteractiveFlag.all - InteractiveFlag.rotate,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName:
                                  'dev.fleaflet.flutter_map.example',
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: selectedAddress
                                      .value!.geometry.location
                                      .toLatLng(),
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
                      Text(
                        'Address: ${selectedAddress.value!.formattedAddress}',
                      ),
                      Text(
                        'LatLong: ${selectedAddress.value!.geometry.location}',
                      ),
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
                        formKey.currentState?.reset();
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
                        if (selectedAddress.value == null) {
                          return;
                        }
                        if (formKey.currentState?.saveAndValidate() ?? false) {
                          final searchPhrase = formKey.currentState
                              ?.fields[searchPhraseName]?.value as String?;
                          saveAddress(
                            GoRouter.of(context),
                            selectedAddress.value!,
                            searchPhrase,
                            publicListId,
                            listItemId,
                          );
                        } else {
                          logger.d('validation failed');
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
    final toReturn =
        result.copyWith(searchPhrase: searchPhrase ?? 'No search phrase');
    logger.d('toReturn: $toReturn');
    router.pop(toReturn);
  }
}
