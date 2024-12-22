import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/auth/bloc/auth_bloc.dart';

const toolbarHeight = 60.0;

class ListPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ListPageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Lists'),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            context.read<AuthBloc>().add(Logout());
          },
        ),
      ],
    );
  }

  // List<AppBarAction<dynamic>> getAppBarActions(
  //   BuildContext context,
  //   ListViewType listType,
  // ) {
  //   return [
  //     if (listType == ListViewType.tiles)
  //       AppBarAction(
  //         type: AppBarActionType.icon,
  //         iconAction: AppBarActionIcon(
  //           title: 'Show as list',
  //           icon: Icons.list,
  //           callback: () {
  //             context.read<ListTypeCubit>().toggle();
  //           },
  //           key: const Key('show_list_as_list'),
  //         ),
  //       ),
  //     if (listType == ListViewType.list)
  //       AppBarAction(
  //         type: AppBarActionType.icon,
  //         iconAction: AppBarActionIcon(
  //           title: 'Show as tiles',
  //           icon: Icons.square_outlined,
  //           callback: () {
  //             context.read<ListTypeCubit>().toggle();
  //           },
  //           key: const Key('show_list_as_tiles'),
  //         ),
  //       ),
  //   ];
  // }
}
