import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:allmylists/custom/firestore/listItems/list_item_events/list_item_state.dart';
import 'package:allmylists/custom/firestore/listItems/list_items.dart';
import 'package:allmylists/custom/firestore/lists/lists.dart';
import 'package:allmylists/custom/navigation/routes.dart';
import 'package:allmylists/custom/pages/listItems/list_items.dart';
import 'package:allmylists/custom/pages/lists/lists.dart';
import 'package:allmylists/standard/navigation/redirect_cubit.dart';

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
      ],
      child: child,
    );
  }
}
