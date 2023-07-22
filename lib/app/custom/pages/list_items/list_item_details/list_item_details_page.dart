import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import '/app/custom/pages/list_items/list_item.dart';
import '/app/custom/pages/list_items/list_item_provider.dart';
import '/app/custom/pages/lists/list_of_things.dart';
import '/app/custom/pages/lists/lists_provider.dart';
import '/app/standard/helpers/constants.dart';
import '/app/standard/widgets/common_scaffold.dart';
import '/app/standard/widgets/double_async_value_widget.dart';

class ListItemDetailsPage extends ConsumerWidget {
  const ListItemDetailsPage({
    required this.publicListId,
    this.listItemId,
    super.key,
  });

  final String publicListId;
  final String? listItemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DoubleAsyncValueWidget<ListItem?, ListOfThings?>(
      firstValue:
          ref.watch(listItemProvider(Tuple2(publicListId, listItemId!))),
      secondValue: ref.watch(listProvider(publicListId)),
      data: (listItem, list) =>
          ListItemDetailsInner(listItem: listItem, list: list),
    );
  }
}

class ListItemDetailsInner extends ConsumerStatefulWidget {
  const ListItemDetailsInner({
    required this.listItem,
    required this.list,
    super.key,
  });
  final ListItem? listItem;
  final ListOfThings? list;

  @override
  ConsumerState<ListItemDetailsInner> createState() {
    return _ListItemDetailsInnerState();
  }
}

class _ListItemDetailsInnerState extends ConsumerState<ListItemDetailsInner> {
  @override
  Widget build(BuildContext context) {
    if (widget.listItem == null) {
      return const Text('No item');
    }
    return CommonScaffold(
      title: '${widget.listItem!.name} Details',
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 16),
              const Text(
                'Item name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('  ${widget.listItem!.name}'),
              const SizedBox(height: 16),
              const Text(
                'Categories',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ...widget.listItem!.categories.entries.map(
                (entry) => Row(
                  children: [
                    Text(
                      '   ${entry.key}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(entry.value.join(', '))
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Address',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('  ${widget.listItem?.address ?? ''}'),
              const SizedBox(height: 16),
              const Text(
                'Position',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '  ${widget.listItem?.latLong?.lat}x${widget.listItem?.latLong?.lng} ',
              ),
              const SizedBox(height: 16),
              const Text(
                'URLs',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ...widget.listItem!.urls.map(
                (url) => Row(
                  children: [
                    Text('   $url: '),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Extra info',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('  ${widget.listItem?.info ?? ''}'),
              const SizedBox(height: 16),
              const Text(
                'Date',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '  ${widget.listItem?.datetime != null ? dateFormatter.format(widget.listItem!.datetime!) : ''}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  DateTime getCurrentDate() {
    var now = DateTime.now();
    // ignore: join_return_with_assignment
    now = now.subtract(
      Duration(
        hours: now.hour,
        minutes: now.minute,
        seconds: now.second,
        milliseconds: now.millisecond,
        microseconds: now.microsecond,
      ),
    );
    return now;
  }
}
