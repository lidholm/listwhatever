import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/pages/listItems/list_item.dart';
import 'package:listwhatever/custom/pages/listItems/list_item_crud_bloc/list_item_crud_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/list_item_crud_bloc/list_item_crud_state.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_event.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_state.dart';
import 'package:listwhatever/custom/pages/listItems/list_or_list_item_not_loaded_handler.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:pluto_grid/pluto_grid.dart';

/// PlutoGrid Example
//
/// For more examples, go to the demo web link on the github below.
class ListAsSpreadsheetsPage extends StatefulWidget {
  const ListAsSpreadsheetsPage({required this.listId, super.key});
  final String listId;

  @override
  State<ListAsSpreadsheetsPage> createState() => _ListAsSpreadsheetsPageState();
}

class _ListAsSpreadsheetsPageState extends State<ListAsSpreadsheetsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListItemsLoadBloc>(context).add(LoadListItems(widget.listId));
  }

  /// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
  /// You can manipulate the grid dynamically at runtime by passing this through the `onLoaded` callback.
  late final PlutoGridStateManager stateManager;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ListItemCrudBloc, ListItemCrudState>(
      listener: (context, state) {
        print('state: $state');
        if (state is ListItemCrudImported) {
          GoRouter.of(context).pop();
        }
      },
      child: BlocBuilder<ListItemsLoadBloc, ListItemsLoadState>(
        builder: (listItemsContext, listItemsState) {
          final listItemsStateView = ListOrListItemNotLoadedHandler.handleListItemsState(listItemsState);
          if (listItemsStateView != null) {
            return listItemsStateView;
          }

          final items = (listItemsState as ListItemsLoadLoaded).listItems;
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(child: getPlutoGrid(items)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(onPressed: () {}, child: const Text('Save')),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  PlutoGrid getPlutoGrid(List<ListItem> items) {
    final categories = getCategories(items);

    return PlutoGrid(
      columns: getColumns(categories),
      rows: getRows(items, categories),
      columnGroups: getColumnGroups(categories),
      onLoaded: (PlutoGridOnLoadedEvent event) {
        stateManager = event.stateManager;
        // stateManager.setShowColumnFilter(true);
      },
      // onChanged: (PlutoGridOnChangedEvent event) {
      //   print(event);
      // },
      // configuration: const PlutoGridConfiguration(),
    );
  }

  List<PlutoColumn> getColumns(Map<String, Set<String>> categories) {
    final categoryColumns = categories.entries
        .map(
          (categoryEntry) => PlutoColumn(
            title: categoryEntry.key,
            field: categoryEntry.key,
            type: PlutoColumnType.text(),
          ),
        )
        .toList();
    final columns = <PlutoColumn>[
      PlutoColumn(
        title: '',
        field: 'delete',
        width: 60,
        enableContextMenu: false,
        enableDropToResize: false,
        type: PlutoColumnType.text(),
        renderer: (rendererContext) {
          return IconButton(
            icon: const Icon(
              Icons.delete,
            ),
            onPressed: () {
              rendererContext.stateManager.removeRows([rendererContext.row]);
            },
            iconSize: 18,
          );
        },
      ),
      PlutoColumn(
        title: 'Name',
        field: 'name',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Urls',
        field: 'urls',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Address',
        field: 'address',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'LatLong',
        field: 'latlong',
        type: PlutoColumnType.text(),
      ),
      ...categoryColumns,
    ];
    return columns;
  }

  List<PlutoRow> getRows(List<ListItem> items, Map<String, Set<String>> categories) {
    final rows = items.map(
      (item) {
        final categoryMap = {
          for (final c in categories.entries)
            c.key: PlutoCell(value: item.categories.containsKey(c.key) ? item.categories[c.key]!.join(', ') : ''),
        };
        return PlutoRow(
          cells: {
            'name': PlutoCell(value: item.name),
            'urls': PlutoCell(value: item.urls.join(', ')),
            'address': PlutoCell(value: item.address),
            'latlong': PlutoCell(value: item.latLong == null ? '' : '${item.latLong?.lat}, ${item.latLong?.lng}'),
            'delete': PlutoCell(value: ''),
            ...categoryMap,
          },
        );
      },
    ).toList();

    return rows;
  }

  List<PlutoColumnGroup> getColumnGroups(Map<String, Set<String>> categories) {
    final columnGroups = <PlutoColumnGroup>[
      PlutoColumnGroup(title: '', fields: ['delete']),
      PlutoColumnGroup(title: 'Standard fields', fields: ['name', 'urls']),
      PlutoColumnGroup(title: 'Location', fields: ['address', 'latlong']),
      PlutoColumnGroup(title: 'Categories', fields: categories.keys.toList()),
    ];
    return columnGroups;
  }
}
