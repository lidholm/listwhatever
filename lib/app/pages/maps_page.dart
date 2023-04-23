import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:listanything/app/navigation/routes/add_list_item_route.dart';
import 'package:listanything/app/navigation/routes/edit_list_item_route.dart';
import 'package:listanything/app/navigation/routes/edit_list_route.dart';
import 'package:listanything/app/navigation/routes/filter_page_route.dart';
import 'package:listanything/app/navigation/routes/list_items_page_route.dart';
import 'package:listanything/app/navigation/routes/routes.dart';
import 'package:listanything/app/pages/list_items/filter_provider.dart';
import 'package:listanything/app/pages/list_items/filtered_list_items_provider.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/widgets/standardWidgets/app_bar_action.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';
import 'package:listanything/app/widgets/standardWidgets/exception_widget.dart';

double doubleInRange(Random source, num start, num end) => source.nextDouble() * (end - start) + start;

class MapsPage extends ConsumerWidget {
  const MapsPage({super.key, required this.publicListId});
  final String publicListId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(filteredListItemsAndListProvider(publicListId)).when(
          error: (e, st) => ExceptionWidget(e: e, st: st),
          loading: () => MapsPageInner(
            items: List.generate(5, (index) => const ListItem(name: '', categories: {})),
            isLoading: true,
            list: const ListOfThings(name: 'Not used', userId: 'Not used since a shimmer', type: ListType.other),
          ),
          data: (value) {
            final list = value.item2;
            final items = value.item1;
            return MapsPageInner(items: items, isLoading: false, list: list!);
          },
        );
  }
}

class MapsPageInner extends ConsumerWidget {
  const MapsPageInner({super.key, required this.items, required this.isLoading, required this.list});
  final List<ListItem> items;
  final bool isLoading;
  final ListOfThings list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filterProvider);

    final allMarkers = items
        .where((item) => item.latLong != null)
        .map(
          (item) => Marker(
            point: LatLng(item.latLong!.lat, item.latLong!.lng),
            builder: (context) => const Icon(
              Icons.circle,
              color: Colors.red,
              size: 12,
            ),
          ),
        )
        .toList();

    return CommonScaffold(
      title: 'Items',
      actions: [
        AppBarAction(
          title: 'Show list',
          icon: Icons.list,
          callback: () => showListItemPage(ref, context, list.id!),
          overflow: false,
        ),
        AppBarAction(
          title: 'New item',
          icon: Icons.playlist_add_outlined,
          callback: () => addNewListItem(ref, context, list.publicListId!),
          overflow: false,
        ),
        AppBarAction(
          title: 'Filter',
          icon: filters.anySelectedFilters(listHasDates: list.withDates) ? Icons.filter_alt : Icons.filter_alt_off,
          callback: () => filterPage(context, list.publicListId!),
          overflow: false,
        ),
        AppBarAction(
          title: 'Edit list',
          icon: Icons.edit,
          callback: () => editList(ref, context, list.publicListId!),
          overflow: true,
        ),
      ],
      body: Column(
        children: [
          Flexible(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(32.71009, -117.16063),
                zoom: 13.5,
                interactiveFlags: InteractiveFlag.all - InteractiveFlag.rotate,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                ),
                MarkerLayer(
                  markers: allMarkers,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void editList(WidgetRef ref, BuildContext context, String publicListId) {
    EditListRoute(publicListId: publicListId).push(context);
  }

  void editListItem(WidgetRef ref, BuildContext context, ListItem listItem, String publicListId) {
    EditListItemRoute(publicListId: publicListId, listItemId: listItem.id).push(context);
  }

  void addNewListItem(WidgetRef ref, BuildContext context, String publicListId) {
    AddListItemRoute(publicListId: publicListId).push(context);
  }

  void filterPage(BuildContext context, String publicListId) {
    FilterPageRoute(publicListId: publicListId).push(context);
  }

  void showListItemPage(WidgetRef ref, BuildContext context, String publicListId) {
    ListItemsPageRoute(publicListId: publicListId).push(context);
  }
}
