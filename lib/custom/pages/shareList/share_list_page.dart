import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '/custom/firestore/listItems/list_or_list_item_not_loaded_handler.dart';
import '/custom/firestore/lists/list_events/list_bloc.dart';
import '/custom/firestore/lists/list_events/list_event.dart';
import '/custom/firestore/lists/list_events/list_state.dart';
import '/standard/widgets/appBar/common_app_bar.dart';

class ShareListPage extends StatefulWidget {
  const ShareListPage({
    required this.listId,
    super.key,
  });

  final String listId;

  @override
  State<ShareListPage> createState() => _ShareListPageState();
}

class _ShareListPageState extends State<ShareListPage> {
  @override
  void initState() {
    BlocProvider.of<ListBloc>(context).add(LoadList(widget.listId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listState = context.watch<ListBloc>().state;

    final listStateView = ListOrListItemNotLoadedHandler.handleListState(listState);
    // logger.i('listState: $listState');
    if (listStateView != null) {
      return listStateView;
    }
    final list = (listState as ListLoaded).list!;

    const headerStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 20,
    );

    return Scaffold(
      appBar: CommonAppBar(title: 'Share "${list.name}"'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Share list with friends',
            style: headerStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Enable'),
              OutlinedButton(
                onPressed: () {
                  BlocProvider.of<ListBloc>(context).add(UpdateList(list.copyWith(shared: true)));
                },
                child: Row(
                  children: [
                    if (list.shared) const Icon(Icons.check_box) else const Icon(Icons.check_box_outline_blank),
                    const Text('Enable'),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  BlocProvider.of<ListBloc>(context).add(UpdateList(list.copyWith(shared: false)));
                },
                child: Row(
                  children: [
                    if (!list.shared) const Icon(Icons.check_box) else const Icon(Icons.check_box_outline_blank),
                    const Text('Disable'),
                  ],
                ),
              ),
            ],
          ),
          // if (list.shared) ...[
          const Text('Viewers'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _copyUrl(generateUrl(list.shareCodeForViewer!));
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Text('Copy url'),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  _shareUrl(generateUrl(list.shareCodeForViewer!));
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Text('Share url'),
                ),
              ),
            ],
          ),
          const Text('Editors'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _copyUrl(generateUrl(list.shareCodeForEditor!));
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Text('Copy url'),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  _shareUrl(generateUrl(list.shareCodeForEditor!));
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Text('Share url'),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Text('Close'),
            ),
          ),
        ],
        // ],
      ),
    );
  }

  String generateUrl(String shareCode) {
    return 'http://localhost:5000/lists/subscribe/$shareCode';
  }

  Future<void> _copyUrl(String url) async {
    await Clipboard.setData(ClipboardData(text: url));
  }

  Future<void> _shareUrl(String url) async {
    await Share.share(url);
  }
}
