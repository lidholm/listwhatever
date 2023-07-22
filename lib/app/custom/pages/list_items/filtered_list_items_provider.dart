import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/custom/geocoder/latlong.dart';
import '/app/custom/pages/list_items/filter_list_items.dart';
import '/app/custom/pages/list_items/filter_provider.dart';
import '/app/custom/pages/list_items/list_item.dart';
import '/app/custom/pages/list_items/list_items_provider.dart';
import '/app/custom/pages/lists/lists_provider.dart';
import '/app/custom/pages/map/location_provider.dart';
import '/app/standard/helpers/combine_three_async_values.dart';
import '/app/standard/helpers/constants.dart';

final filteredListItemsProvider =
    Provider.family<AsyncValue<List<ListItem>>, String>((ref, publicListId) {
  logger.d('filteredListIemsProvider: here');
  final listItemsValue = ref.watch(listItemsProvider(publicListId));
  final listValue = ref.watch(listProvider(publicListId));
  final filters = ref.watch(filterProvider);
  final locationValue = ref.watch(locationProvider);

  return combineThreeAsyncValues(listItemsValue, listValue, locationValue).when(
    loading: () {
      logger.d('filteredListIemsProvider loading');
      return const AsyncValue.loading();
    },
    error: (e, st) {
      logger
        ..d('filteredListIemsProvider error: $e')
        ..d('filteredListIemsProvider error: $st');
      return AsyncValue.error(e, st);
    },
    data: (tuple) {
      final listItems = tuple.item1;
      final list = tuple.item2;
      final location = tuple.item3;
      final filterCenter = location.latitude == null
          ? null
          : LatLong(lat: location.latitude!, lng: location.longitude!);
      logger.d('$publicListId: listItems: ${listItems?.length}');
      return AsyncValue.data(
        filterListItems(
          allItems: listItems ?? [],
          filters: filters,
          listHasDates: list.withDates,
          listHasMap: list.withMap,
          distanceFilterCenter: filterCenter,
        ),
      );
    },
  );
});
