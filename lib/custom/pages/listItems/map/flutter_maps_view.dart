import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:listwhatever/custom/pages/listItems/filters/bloc/filter_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/filters/bloc/filter_state.dart';
import 'package:listwhatever/custom/pages/listItems/filters/filtering.dart';
import 'package:listwhatever/custom/pages/listItems/listItemsListView/list_items_sort_order_cubit.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_state.dart';
import 'package:listwhatever/custom/pages/lists/list_load_events/list_load_bloc.dart';
import 'package:listwhatever/custom/pages/lists/list_load_events/list_load_state.dart';

import '/custom/currentLocationBloc/current_location_bloc.dart';
import '/custom/pages/listItems/map/custom_marker.dart';
import '/custom/pages/listItems/models/list_item.dart';

class FlutterMapsView extends StatefulWidget {
  const FlutterMapsView({required this.onTap, super.key});
  final void Function(String itemId) onTap;

  @override
  FlutterMapsViewState createState() => FlutterMapsViewState();
}

class FlutterMapsViewState extends State<FlutterMapsView> {
  static String className = 'FlutterMapsView';
  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sortOrder = context.watch<ListItemsSortOrderCubit>().state;

    final listState = context.watch<ListLoadBloc>().state;
    final listItemsState = context.watch<ListItemsLoadBloc>().state;
    final currentLocation = context.watch<CurrentLocationCubit>().state;
    final filtersState = context.watch<FilterBloc>().state;

    var items = <ListItem>[];

    if (listState is ListLoadLoaded &&
        listItemsState is ListItemsLoadLoaded &&
        listState.list != null &&
        filtersState is FiltersUpdated) {
      final list = listState.list!;
      items = listItemsState.listItems;
      final filters = filtersState.filters;

      items = Filtering.sortAndFilterItems(list, items, filters, sortOrder);
    }

    final options = getMapOptions(items);

    final currentLocationMarker = getCurrentLocationMarker(currentLocation);
    return Column(
      children: [
        Flexible(
          child: FlutterMap(
            options: options,
            children: [
              openStreetMapTileLayer,
              MarkerLayer(
                markers: [
                  ...getMarkers(items),
                  if (currentLocationMarker != null) currentLocationMarker,
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  MapOptions getMapOptions(List<ListItem> items) {
    final initialCenter = getCenter(items);
    return initialCenter != null
        ? MapOptions(
            initialCenter: initialCenter,
            initialZoom: 11,
          )
        : const MapOptions(
            initialZoom: 11,
          );
  }

  (LatLng, LatLng)? getBounds(List<ListItem> items) {
    final latLngList = items
        .where((e) => e.latLong != null)
        .map((e) => e.latLong!.toLatLng())
        .toList();
    //
    if (latLngList.isEmpty) {
      return null;
    }

    double? x0;
    double? x1;
    double? y0;
    double? y1;
    for (final latLng in latLngList) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return (LatLng(x1!, y1!), LatLng(x0!, y0!));
  }

  LatLng? getCenter(List<ListItem> items) {
    final bounds = getBounds(items);
    if (bounds == null) {
      return null;
    }
    return LatLng(
      (bounds.$1.latitude - bounds.$2.latitude) / 2 + bounds.$2.latitude,
      (bounds.$1.longitude - bounds.$2.longitude) / 2 + bounds.$2.longitude,
    );
  }

  List<Marker> getMarkers(List<ListItem> items) {
    final markers = <Marker>[];
    for (final item in items) {
      if (item.latLong != null) {
        markers.add(
          Marker(
            point: LatLng(
              item.latLong!.lat,
              item.latLong!.lng,
            ),
            child: CustomMarker(
              color: Colors.red,
              onPressed: () {
                widget.onTap(item.id!);
              },
            ),
          ),
        );
      }
    }
    return markers;
  }

  Marker? getCurrentLocationMarker(Position? currentLocation) {
    if (currentLocation == null) {
      return null;
    }
    return Marker(
      point: LatLng(
        currentLocation.latitude,
        currentLocation.longitude,
      ),
      child: CustomMarker(
        color: Colors.blue,
        onPressed: () {},
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.anywhostudios.listwhatever',
      // Use the recommended flutter_map_cancellable_tile_provider package to
      // support the cancellation of loading tiles.
      tileProvider: CancellableNetworkTileProvider(),
    );
