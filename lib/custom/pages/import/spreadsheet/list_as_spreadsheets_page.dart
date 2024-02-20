import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/pages/listItems/list_item.dart';
import 'package:listwhatever/custom/pages/listItems/list_item_crud_bloc/list_item_crud_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/list_item_crud_bloc/list_item_crud_event.dart';
import 'package:listwhatever/custom/pages/listItems/list_item_crud_bloc/list_item_crud_state.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_event.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_state.dart';
import 'package:listwhatever/custom/pages/listItems/list_or_list_item_not_loaded_handler.dart';
import 'package:listwhatever/custom/pages/lists/list_load_events/list_load_bloc.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:pluto_grid/pluto_grid.dart';

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

  @override
  Widget build(BuildContext context) {
    // final listState = context.watch<ListLoadBloc>().state;
    final listItemsState = context.watch<ListItemsLoadBloc>().state;

    final listItemsStateView = ListOrListItemNotLoadedHandler.handleListItemsState(listItemsState);
    if (listItemsStateView != null) {
      return listItemsStateView;
    }

    final items = (listItemsState as ListItemsLoadLoaded).listItems;

    return BlocListener<ListItemCrudBloc, ListItemCrudState>(
      listener: (context, state) {
        print('state: $state');
        if (state is ListItemCrudImported) {
          GoRouter.of(context).pop();
        }
      },
      child: ListAsSpreadsheetsPageInner(items: items, listId: widget.listId),
    );
  }
}

class ListAsSpreadsheetsPageInner extends StatefulWidget {
  const ListAsSpreadsheetsPageInner({required this.items, required this.listId, super.key});

  final String listId;
  final List<ListItem> items;

  @override
  State<ListAsSpreadsheetsPageInner> createState() => _ListAsSpreadsheetsPageInnerState();
}

class _ListAsSpreadsheetsPageInnerState extends State<ListAsSpreadsheetsPageInner> {
  late final PlutoGridStateManager stateManager;
  late List<ListItem> _items;

  @override
  void initState() {
    super.initState();
    _items = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(child: getPlutoGrid()),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: save,
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  PlutoGrid getPlutoGrid() {
    final categories = getCategories(_items);

    return PlutoGrid(
      columns: getColumns(categories),
      rows: getRows(categories),
      columnGroups: getColumnGroups(categories),
      onLoaded: (PlutoGridOnLoadedEvent event) {
        stateManager = event.stateManager;
      },
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

  List<PlutoRow> getRows(Map<String, Set<String>> categories) {
    final rows = _items.map(
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

  ListItem createListItem(ListItem item, PlutoRow row, Map<String, Set<String>> categories) {
    final name = row.cells['name']?.value as String? ?? item.name;
    final urls = (row.cells['urls']?.value as String?)?.split(',').map((e) => e.trim()).toList() ?? item.urls;
    final updatedItem = item.copyWith(
      name: name,
      urls: urls,
    );
    print('updatedItem: $updatedItem');

    return updatedItem;
  }

  void save() {
    final categorieNames = getCategories(_items).entries.map((e) => e.key).toList();

    final listItems = <ListItem>[];

    for (final (rowIndex, row) in stateManager.rows.indexed) {
      final name = getValueFromRow<String>(row, 'name', false);
      final urls = getValueFromRow<String>(row, 'urls', false).split(',').map((e) => e.trim()).toList();

      final categories = <String, List<String>>{};

      for (final cellName in categorieNames) {
        final values = getValueFromRow<String>(row, cellName, false)
            .split(',')
            .map((e) => e.trim())
            .where((e) => e != '')
            .toList();
        if (values.isNotEmpty) {
          categories[cellName] = values;
        }
      }

      final item = _items[rowIndex].copyWith(
        name: name,
        urls: urls,
        categories: categories,
      );
      listItems.add(item);
    }

    BlocProvider.of<ListItemCrudBloc>(context).add(ImportListItems(widget.listId, listItems));
  }

  // ignore: avoid_positional_boolean_parameters
  T getValueFromRow<T>(PlutoRow row, String cellName, bool allowNull) {
    final value = row.cells.entries
        .firstWhere((e) {
          print('e.ket: ${e.key} - $cellName');
          return e.key == cellName;
        })
        .value
        .value as T;
    if (!allowNull) {
      assertField(value, cellName);
    }
    return value;
  }

  String? convertEmptyToNull(String value) {
    if (value.trim() == '') {
      return null;
    }
    return value;
  }

  void assertField(Object? field, String s) {
    if (field == null) {
      throw Exception("'name' is required");
    }
  }
}
