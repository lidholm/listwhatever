import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firestore_provider.dart';
import 'package:listanything/app/navigation/routes/add_or_edit_list_route.dart';
import 'package:listanything/app/navigation/routes/routes.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/lists_provider.dart';
import 'package:listanything/app/pages/lists/selected_list_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/async_value_widget.dart';
import 'package:listanything/app/widgets/standardWidgets/image_button.dart';

const images = {
  ListType.restaurants: 'assets/images/restaurants.jpeg',
  ListType.food: 'assets/images/food.webp',
  ListType.movies: 'assets/images/movies.webp',
  ListType.activities: 'assets/images/activities.png',
};

class ListsPage extends ConsumerWidget {
  const ListsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Firestore Example: Movies'),
            AsyncValueWidget<FirebaseFirestore>(
              value: ref.watch(firestoreProvider),
              data: (firestore) => StreamBuilder(
                stream: firestore.snapshotsInSync(),
                builder: (context, _) {
                  return Text(
                    'Latest Snapshot: ${DateTime.now()}',
                    style: Theme.of(context).textTheme.bodySmall,
                  );
                },
              ),
            )
          ],
        ),
      ),
      body: AsyncValueWidget<List<ListOfThings>>(
        value: ref.watch(listsProvider),
        data: (lists) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: CustomScrollView(
              slivers: [
                SliverGrid.count(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                  children: [
                    ...lists
                        .map(
                          (list) => ImageButton<ListOfThings>(
                            item: list,
                            image: images[list.type] ?? 'assets/images/generic.jpg',
                            text: list.name,
                            callback: (list) => selectList(ref, context, list),
                          ),
                        )
                        .toList(),
                    ImageButton<void>(
                      item: null,
                      image: 'assets/images/plus.jpg',
                      text: 'Add new list',
                      callback: (_) => addNewList(ref, context),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void selectList(WidgetRef ref, BuildContext context, ListOfThings list) {
    ref.read(selectedListProvider.notifier).state = list;
    const AddOrEditListRoute().push(context);
    print(list);
  }

  Future<void> addNewList(WidgetRef ref, BuildContext context) async {
    const AddOrEditListRoute().push(context);
  }
}
