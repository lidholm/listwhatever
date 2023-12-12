import 'package:bloc/bloc.dart';
import 'package:listanything/custom/pages/listItems/searchLocation/geocoder/geocoder.dart';
import 'package:listanything/standard/api_keys.dart';
import 'package:listanything/standard/constants.dart';

import 'search_location_event.dart';
import 'search_location_state.dart';

class SearchLocationBloc extends Bloc<SearchEvent, SearchState> {
  SearchLocationBloc() : super(SearchInitial()) {
    on<Search>(_onSearch);
  }

  Future<void> _onSearch(Search event, Emitter<SearchState> emit) async {
    try {
      emit(SearchLoading());

      final results = await Geocoder.getDataFromAddress(
        address: event.phrase,
        googleMapApiKey: getMapsApiKey(),
      );
      // final results = <GeocoderResult>[
      //   GeocoderResult(
      //     addressComponents: [],
      //     formattedAddress: 'One street 123',
      //     geometry: Geometry(
      //         location: const LatLong(lat: 37.42796133580664, lng: -122.085749655962),
      //         locationType: 'type',
      //         viewport:
      //             Bounds(northeast: const LatLong(lat: 123, lng: 234), southwest: const LatLong(lat: 123, lng: 234)),),
      //     partialMatch: false,
      //     placeId: 'id',
      //     plusCode: PlusCode(compoundCode: '', globalCode: ''),
      //     types: [],
      //   ),
      //   GeocoderResult(
      //     addressComponents: [],
      //     formattedAddress: 'Main street and 4th',
      //     geometry: Geometry(
      //       location: const LatLong(lat: 37.43796133580664, lng: -122.085749655962),
      //       locationType: 'type',
      //       viewport:
      //           Bounds(northeast: const LatLong(lat: 123, lng: 234), southwest: const LatLong(lat: 123, lng: 234)),
      //     ),
      //     partialMatch: false,
      //     placeId: 'id',
      //     plusCode: PlusCode(compoundCode: '', globalCode: ''),
      //     types: [],
      //   ),
      // ];

      emit(SearchLoaded(results));
    } catch (e) {
      logger.e('Error: $e');
      emit(SearchError('Failed to load lists.\n$e'));
    }
  }
}
