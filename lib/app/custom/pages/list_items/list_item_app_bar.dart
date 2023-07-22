import 'package:flutter/material.dart';
import '/app/custom/pages/lists/list_of_things.dart';
import '/app/custom/pages/lists/lists_page.dart';
import '/app/standard/widgets/expanded_app_bar_content.dart';

const collapsedBarHeight = 0.0;
const expandedBarHeight = 140.0;

class ListItemAppBar extends StatelessWidget {
  const ListItemAppBar({
    required this.list,
    required this.isLoading,
    required this.expandedPercentage,
    super.key,
  });
  final ListOfThings? list;
  final bool isLoading;
  final double expandedPercentage;
  @override
  Widget build(BuildContext context) {
    final listBackground = images[list?.type] ?? 'assets/images/generic.jpg';
    return SliverAppBar(
      expandedHeight: expandedBarHeight,
      collapsedHeight: collapsedBarHeight,
      toolbarHeight: 0,
      centerTitle: false,
      pinned: true,

      /// 1
      title: const Text(
        '',
      ),
      elevation: 0,

      /// 2
      backgroundColor: Colors.transparent,
      leading: const BackButton(
        color: Colors.white,
      ),

      /// 3
      flexibleSpace: FlexibleSpaceBar(
        background: ExpandedAppBarContent(
          background: listBackground,
          title: list?.name ?? '',
          isLoading: isLoading,
          expandedPercentage: expandedPercentage,
        ),
      ),
    );
  }
}
