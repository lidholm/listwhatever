import 'package:flutter/material.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';

class ListPage extends StatefulWidget {
  const ListPage({required this.list, super.key});
  final ListOfThings list;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/restaurants.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              widget.list.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item ${index + 1}'),
                );
              },
              childCount: 20, // Number of items in the list
            ),
          ),
        ],
      ),
    );
  }
}
