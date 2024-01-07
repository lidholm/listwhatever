// ignore: unused_import
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '/custom/pages/listItems/list_or_list_item_not_loaded_handler.dart';
import '/custom/pages/shareList/bloc/shared_list_bloc.dart';
import '/custom/pages/shareList/bloc/shared_list_event.dart';
import '/custom/pages/shareList/bloc/shared_list_state.dart';
import '/custom/pages/subscribeList/bloc/subscribe_list_bloc.dart';
import '/custom/pages/subscribeList/bloc/subscribe_list_event.dart';
import '/l10n/l10n.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import '/standard/widgets/vStack/h_stack.dart';
import '/standard/widgets/vStack/v_stack.dart';

class SubscribeListPage extends StatefulWidget {
  const SubscribeListPage({
    required this.shareCode,
    super.key,
  });

  final String shareCode;

  @override
  State<SubscribeListPage> createState() => _SubscribeListPageState();
}

class _SubscribeListPageState extends State<SubscribeListPage> {
  @override
  void initState() {
    BlocProvider.of<SharedListBloc>(context).add(LoadSharedList(widget.shareCode));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: context.l10n.sharedListsHeader,
      ),
      body: BlocBuilder<SharedListBloc, SharedListState>(
        builder: (context, state) {
          final listStateView = ListOrListItemNotLoadedHandler.handleSharedListState(state);
          if (listStateView != null) {
            return listStateView;
          }
          final list = (state as SharedListLoaded).sharedList;
          return FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: VStack(
              children: [
                Text(context.l10n.sharedListsText(list.ownerName)),
                Text(list.listName),
                Text(context.l10n.sharedListsAcceptQuestionText),
                HStack(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<SubscribeListBloc>().add(SubscribeListForUser(widget.shareCode));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(context.l10n.sharedListsAcceptButtonText),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(context.l10n.sharedListsCancelButtonText),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
