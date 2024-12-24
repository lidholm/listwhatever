import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/components/shimmer/shimmer.dart';
import 'package:listwhatever/components/shimmer/shimmer_loading.dart';
import 'package:listwhatever/pages/lists/bloc/lists_bloc.dart';
import 'package:listwhatever/pages/lists/components/list_tiles.dart';
import 'package:listwhatever/pages/lists/components/lists_page_app_bar.dart';
import 'package:listwhatever/pages/lists/routes/add_list_page_route.dart';
import 'package:listwhatever/routing/routes.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListsBloc>(context).add(const ListsEvent.watchUserLists());
    // BlocProvider.of<FirebaseStorageBloc>(context)
    //     .add(const FirebaseStorageEvent.getAllUserLists());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ListsPageAppBar(),
      body: const Shimmer(linearGradient: shimmerGradient, child: ListTiles()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const AddListPageRoute().push<void>(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
