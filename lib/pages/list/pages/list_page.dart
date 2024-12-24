import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/pages/list/bloc/list_bloc.dart';
import 'package:listwhatever/pages/list/bloc/list_event.dart';
import 'package:listwhatever/pages/list/bloc/list_state.dart';
import 'package:listwhatever/pages/list/models/list_item.dart';
import 'package:listwhatever/pages/list/routes/add_list_item_page_route.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';
import 'package:listwhatever/routing/routes.dart';

const addListButtonKey = Key('AddListButtonKey');

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
    final items = getItems(listState);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        key: addListButtonKey,
        onPressed: () {
          AddListItemPageRoute(actualListId: list!.id!).push<void>(context);
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
                      title: Text(items[index].name),
                      subtitle: Text(getSubtitle(items[index])),
                    ),
                  ),
                );
              },
              childCount: items.length,
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

  List<ListItem> getItems(ListState listState) {
    if (listState is ListInitial) {
      return [];
    }
    if (listState is ListLoading) {
      return [];
    }
    if (listState is ListLoaded) {
      return listState.listItems;
    }
    return [];
  }

  String getSubtitle(ListItem item) {
    if (item.info == null) {
      return '';
    }
    return item.info!.substring(0, min(item.info!.length, 60));
  }
}
