import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/custom/pages/lists/page/lists_page_route.dart';

import '/custom/navigation/routes.dart';
import '/custom/pages/lists/list_events/list_state.dart';
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
      ],
      child: child,
    );
  }
}
