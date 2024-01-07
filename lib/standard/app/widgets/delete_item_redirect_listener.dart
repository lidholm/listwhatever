import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/custom/navigation/routes.dart';
import '/custom/pages/listItems/list_item_events/list_item_bloc.dart';
import '/custom/pages/listItems/list_item_events/list_item_state.dart';
import '/custom/pages/listItems/list_items.dart';
import '/custom/pages/listItems/list_items_events/list_items_bloc.dart';
import '/custom/pages/listItems/list_items_events/list_items_state.dart';
import '/custom/pages/lists/list_events/list_state.dart';
import '/custom/pages/lists/lists.dart';
import '/custom/pages/lists/lists_events/lists_bloc.dart';
import '/custom/pages/lists/lists_events/lists_state.dart';
import '/standard/navigation/redirect_cubit.dart';

class DeleteItemRedirectListener extends StatelessWidget {
  const DeleteItemRedirectListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ListsBloc, ListsState>(
          listener: (context, state) {
            if (state is ListDeleted) {
              context.read<RedirectCubit>().setRedirect('${const ListsPageRoute().location}?t=${DateTime.now()}');
            }
          },
          listenWhen: (previous, current) => previous != current,
        ),
        BlocListener<ListItemsBloc, ListItemsState>(
          listener: (context, state) {
            if (state is ListItemDeleted) {
              final deletedState = state as ListItemDeleted;
              context
                  .read<RedirectCubit>()
                  .setRedirect('${ListItemsPageRoute(listId: deletedState.listId).location}?t=${DateTime.now()}');
            }
          },
          listenWhen: (previous, current) => previous != current,
        ),
        BlocListener<ListItemBloc, ListItemState>(
          listener: (context, state) {
            if (state is ListItemsImported) {
              final userListId = state.listId;
              context.read<RedirectCubit>().setRedirect('${ListItemsPageRoute(listId: userListId).location}?t=${DateTime.now()}');
            }
          },
          listenWhen: (previous, current) => previous != current,
        ),
      ],
      child: child,
    );
  }
}
