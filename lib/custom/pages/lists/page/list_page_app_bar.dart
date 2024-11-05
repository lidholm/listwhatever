import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/custom/pages/lists/page/list_type_cubit/list_type_cubit.dart';
import 'package:listwhatever/l10n/l10n.dart';
import 'package:listwhatever/standard/widgets/appBar/app_bar_action.dart';
import 'package:listwhatever/standard/widgets/appBar/app_bar_action_icon.dart';
import 'package:listwhatever/standard/widgets/appBar/common_app_bar.dart';
import 'package:listwhatever/standard/widgets/shimmer/shimmer.dart';
import 'package:listwhatever/standard/widgets/shimmer/shimmer_loading.dart';

const toolbarHeight = 60.0;

class ListPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ListPageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    final listType = context.watch<ListTypeCubit>().state;

    return Shimmer(
      linearGradient: shimmerGradient,
      child: CommonAppBar(
        title: '',
        titleWidget: _buildTitleWidget(context),
        actions: getAppBarActions(context, listType),
      ),
    );
  }

  Widget _buildTitleWidget(BuildContext context) {
    final titleWidget = Text(
      AppLocalizations.of(context).appTitle,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [titleWidget],
    );
  }

  List<AppBarAction<dynamic>> getAppBarActions(
    BuildContext context,
    ListViewType listType,
  ) {
    return [
      if (listType == ListViewType.tiles)
        AppBarAction(
          type: AppBarActionType.icon,
          iconAction: AppBarActionIcon(
            title: 'Show as list',
            icon: Icons.list,
            callback: () {
              context.read<ListTypeCubit>().toggle();
            },
            key: const Key('show_list_as_list'),
          ),
        ),
      if (listType == ListViewType.list)
        AppBarAction(
          type: AppBarActionType.icon,
          iconAction: AppBarActionIcon(
            title: 'Show as tiles',
            icon: Icons.square_outlined,
            callback: () {
              context.read<ListTypeCubit>().toggle();
            },
            key: const Key('show_list_as_tiles'),
          ),
        ),
    ];
  }
}
