import 'package:flutter/material.dart';
import 'package:listwhatever/components/shimmer/shimmer.dart';
import 'package:listwhatever/components/shimmer/shimmer_loading.dart';
import 'package:listwhatever/pages/lists/components/list_page_app_bar.dart';
import 'package:listwhatever/pages/lists/components/list_tiles.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<ListsLoadBloc>(context).add(WatchLists());
    // BlocProvider.of<FirebaseStorageBloc>(context)
    //     .add(const FirebaseStorageEvent.getAllUserLists());
  }

  @override
  Widget build(BuildContext context) {
    return
        // Shimmer(
        //   linearGradient: shimmerGradient,
        //   child:
        const Scaffold(
      appBar: ListPageAppBar(),
      body: Shimmer(linearGradient: shimmerGradient, child: ListTiles()),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // GoRouter.of(context).pushNamed(RouteName.listItems.value);
      //     // const AddListPageRoute().push<void>(context);
      //   },
      //   child: const Icon(Icons.add),
      // ),
      // ),
    );
  }
}
