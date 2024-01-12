import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/custom/navigation/routes.dart';
import '/custom/pages/listItems/addListItem/edit_list_item_page_route.dart';
import '/custom/pages/listItems/list_or_list_item_not_loaded_handler.dart';
import '/custom/pages/lists/list_events/list_bloc.dart';
import '/l10n/l10n.dart';
import '/standard/constants.dart';
import '/standard/widgets/appBar/app_bar_action.dart';
import '/standard/widgets/appBar/app_bar_action_icon.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import '../list_item_load_bloc/list_item_load_bloc.dart';
import '../list_item_load_bloc/list_item_load_event.dart';
import '../list_item_load_bloc/list_item_load_state.dart';

class ListItemInfoView extends StatefulWidget {
  const ListItemInfoView({required this.listId, required this.itemId, super.key});

  final String? listId;
  final String? itemId;

  @override
  State<ListItemInfoView> createState() => _ListItemInfoViewState();
}

class _ListItemInfoViewState extends State<ListItemInfoView> {
  @override
  void initState() {
    super.initState();
    if (widget.listId != null && widget.itemId != null) {
      BlocProvider.of<ListItemLoadBloc>(context).add(LoadListItem(widget.listId!, widget.itemId!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final listState = context.watch<ListBloc>().state;
    final listItemState = context.watch<ListItemLoadBloc>().state;

    final listStateView = ListOrListItemNotLoadedHandler.handleListAndListItemState(listState, listItemState);
    if (listStateView != null) {
      return listStateView;
    }

    final listItem = (listItemState as ListItemLoaded).listItem;
    if (listItem == null) {
      return const CircularProgressIndicator();
    }
    return Scaffold(
      appBar: CommonAppBar(
        title: '${listItem.name} Details',
        actions: [
          AppBarAction(
            type: AppBarActionType.icon,
            iconAction: AppBarActionIcon(
              title: context.l10n.editListItem,
              icon: Icons.edit,
              key: const Key('editListItemAction'),
              callback: () async {
                final listItemBloc = context.read<ListItemLoadBloc>();
                await EditListItemPageRoute(widget.listId!, listItem.id!).push<void>(context);
                listItemBloc.add(LoadListItem(widget.listId!, listItem.id!));
              },
            ),
          ),
        ],
      ),
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
              Text('  ${listItem.name}'),
              const SizedBox(height: 16),
              const Text(
                'Categories',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ...listItem.categories.entries.map(
                (entry) => Row(
                  children: [
                    Text(
                      '   ${entry.key}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(entry.value.join(', ')),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Address',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('  ${listItem.address ?? ''}'),
              const SizedBox(height: 16),
              const Text(
                'Position',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              if (listItem.latLong != null) ...[
                Text(
                  '  ${listItem.latLong?.lat}x${listItem.latLong?.lng} ',
                ),
              ],
              const SizedBox(height: 16),
              const Text(
                'URLs',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ...listItem.urls.map(
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
              Text('  ${listItem.info ?? ''}'),
              const SizedBox(height: 16),
              const Text(
                'Date',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '  ${listItem.datetime != null ? dateFormatter.format(listItem.datetime!) : ''}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
