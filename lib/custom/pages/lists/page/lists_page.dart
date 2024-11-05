import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/custom/pages/lists/page/list_list.dart';
import 'package:listwhatever/custom/pages/lists/page/list_page_app_bar.dart';
import 'package:listwhatever/custom/pages/lists/page/list_tiles.dart';
import 'package:listwhatever/custom/pages/lists/page/list_type_cubit/list_type_cubit.dart';
import 'package:listwhatever/standard/firebase/firebaseStorageBloc/bloc/firebase_storage_bloc.dart';
import 'package:listwhatever/standard/navigation/view/nav_drawer.dart';
import 'package:listwhatever/standard/widgets/shimmer/shimmer.dart';
import 'package:listwhatever/standard/widgets/shimmer/shimmer_loading.dart';

import '/custom/navigation/routes.dart';
import '/custom/pages/lists/addList/add_list_page_route.dart';
import '/custom/pages/lists/lists_load_events/lists_bloc.dart';
import '/custom/pages/lists/lists_load_events/lists_event.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListsLoadBloc>(context).add(WatchLists());
    BlocProvider.of<FirebaseStorageBloc>(context)
        .add(const FirebaseStorageEvent.getAllUserLists());
  }

  @override
  Widget build(BuildContext context) {
    final listType = context.watch<ListTypeCubit>().state;

    return Shimmer(
      linearGradient: shimmerGradient,
      child: Scaffold(
        drawer: const NavDrawer(),
        appBar: const ListPageAppBar(),
        body: (listType == ListViewType.tiles)
            ? const ListTiles()
            : const ListList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            const AddListPageRoute().push<void>(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
