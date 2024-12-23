import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/components/shimmer/shimmer.dart';
import 'package:listwhatever/components/shimmer/shimmer_loading.dart';
import 'package:listwhatever/pages/lists/bloc/lists_bloc.dart';
import 'package:listwhatever/pages/lists/components/lists_page_app_bar.dart';
import 'package:listwhatever/pages/lists/components/list_tiles.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<ListsBloc>(context).add(const ListsEvent.watchUserLists());
    // BlocProvider.of<FirebaseStorageBloc>(context)
    //     .add(const FirebaseStorageEvent.getAllUserLists());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ListPageAppBar(),
      body: Text('The list'),
    );
  }
}
