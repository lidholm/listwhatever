import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/pages/list/bloc/list_bloc.dart';
import 'package:listwhatever/pages/list/bloc/list_event.dart';
import 'package:listwhatever/pages/list/bloc/list_state.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';
import 'package:listwhatever/routing/go_router_configuration.dart';

class ListPage extends StatefulWidget {
  const ListPage({required this.listId, super.key});
  final String listId;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListBloc>(context).add(GetList(widget.listId));
  }

  @override
  Widget build(BuildContext context) {
    final listState = context.watch<ListBloc>().state;

    getLoading(listState);
    final list = getList(listState);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).pushNamed(RouteName.addListItem.value);
        },
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/restaurants.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              list?.name ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  // TODO: Break out and support shimmer
                  padding: const EdgeInsets.only(top: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text('Item ${index + 1}'),
                      subtitle: const Text('Something here'),
                    ),
                  ),
                );
              },
              childCount: 20, // Number of items in the list
            ),
          ),
        ],
      ),
    );
  }

  bool getLoading(ListState listState) {
    return switch (listState) {
      ListInitial() => true,
      ListLoading() => true,
      ListLoaded() => false,
    };
  }

  ListOfThings? getList(ListState listState) {
    if (listState is ListInitial) {
      return null;
    }
    if (listState is ListLoading) {
      return null;
    }
    if (listState is ListLoaded) {
      return listState.list;
    }
    return null;
  }
}
