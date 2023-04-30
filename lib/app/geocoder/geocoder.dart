// ignore_for_file: avoid_print, unused_local_variable
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:listanything/app/geocoder/bounds.dart';
import 'package:listanything/app/geocoder/geocoderresult.dart';
import 'package:listanything/app/geocoder/geometry.dart';
import 'package:listanything/app/geocoder/latlong.dart';
import 'package:listanything/app/geocoder/pluscode.dart';

const useRealEndpoint = true;

class Geocoder {
  static Future<List<GeocoderResult>?> getDataFromAddress({
    required String address,
    required String googleMapApiKey,
    String? language,
  }) async {
    if (useRealEndpoint) {
      final url = language != null
          ? 'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$googleMapApiKey&language=$language'
          : 'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$googleMapApiKey';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = response.body; //.stream.bytesToString();
        final fetch = json.decode(data) as Map<String, dynamic>;
        final results = fetch['results'] as List<dynamic>;
        //print('results: $results');
        final geoResults = <GeocoderResult>[];
        for (final result in results) {
          final json = result as Map<String, dynamic>;
          final geoResult = GeocoderResult.fromJson(json);
          geoResults.add(geoResult);
        }
        return geoResults;
      }
      return null;
    } else {
      return Future.value([
        GeocoderResult(
          addressComponents: [],
          formattedAddress:
              '9999 Mira Mesa Blvd Suite 102, San Diego, CA 92131, USA',
          geometry: Geometry(
            location: const LatLong(lat: 32.9163275, lng: -117.1116371),
            locationType: 'ROOFTOP',
            viewport: Bounds(
              northeast:
                  const LatLong(lat: 32.9177458802915, lng: -117.1102612697085),
              southwest:
                  const LatLong(lat: 32.9150479197085, lng: -117.1129592302915),
            ),
          ),
          partialMatch: true,
          placeId: 'ChIJGyUPeBf524ARRk_U507Ntak',
          plusCode: PlusCode(
            compoundCode: 'WV8Q+G8 San Diego, CA',
            globalCode: '8544WV8Q+G8',
          ),
          types: [],
        ),
        GeocoderResult(
          addressComponents: [],
          formattedAddress: '1401 Garnet Ave, San Diego, CA 92109, USA',
          geometry: Geometry(
            location: const LatLong(lat: 32.7989096, lng: -117.2442403),
            locationType: 'ROOFTOP',
            viewport: Bounds(
              northeast:
                  const LatLong(lat: 32.8003183802915, lng: -117.2429053697085),
              southwest:
                  const LatLong(lat: 32.7976204197085, lng: -117.2456033302915),
            ),
          ),
          partialMatch: true,
          placeId: 'ChIJnbMB7KNV2YARG_qkiCnaYcY',
          plusCode: PlusCode(
            compoundCode: 'QQX4+H8 San Diego, CA',
            globalCode: '8544QQX4+H8',
          ),
          types: [],
        )
      ]);
    }
  }
}
