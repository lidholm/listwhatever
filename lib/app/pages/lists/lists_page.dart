import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/navigation/routes/add_or_edit_list_route.dart';
import 'package:listanything/app/navigation/routes/list_items_page_route.dart';
import 'package:listanything/app/navigation/routes/routes.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/lists_provider.dart';
import 'package:listanything/app/pages/lists/selected_list_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/app_bar_action.dart';
import 'package:listanything/app/widgets/standardWidgets/common_app_bar.dart';
import 'package:listanything/app/widgets/standardWidgets/common_drawer.dart';
import 'package:listanything/app/widgets/standardWidgets/exception_widget.dart';
import 'package:listanything/app/widgets/standardWidgets/image_button.dart';
import 'package:listanything/app/widgets/standardWidgets/shimmer.dart';
import 'package:listanything/app/widgets/standardWidgets/shimmer_loading.dart';

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
    return ref.watch(listsProvider).when(
          error: (e, st) => ExceptionWidget(e: e, st: st),
          loading: () => ListsPageInner(
            lists: List.generate(8, (index) => const ListOfThings(name: '', type: ListType.other)),
            isLoading: true,
          ),
          data: (lists) => ListsPageInner(lists: lists, isLoading: false),
        );
  }
}

class ListsPageInner extends ConsumerWidget {
  const ListsPageInner({super.key, required this.lists, required this.isLoading});

  final List<ListOfThings> lists;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('screen size: ${MediaQuery.of(context).size.width}');
    final crossAxisCount = kIsWeb ? (MediaQuery.of(context).size.width / 350).floor() : 2;
    return Scaffold(
      drawer: const Drawer(child: CommonDrawer()),
      appBar: CommonAppBar(
        title: 'Lists',
        actions: [
          AppBarAction(
            title: 'New item',
            icon: Icons.playlist_add_outlined,
            callback: () => addNewList(ref, context),
            overflow: false,
          ),
        ],
      ),
      body: Shimmer(
        linearGradient: shimmerGradient,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: CustomScrollView(
            slivers: [
              SliverGrid.count(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                crossAxisCount: crossAxisCount,
                children: lists
                    .map(
                      (list) => ImageButton<ListOfThings>(
                        item: list,
                        image: images[list.type] ?? 'assets/images/generic.jpg',
                        text: list.name,
                        callback: (list) => selectList(ref, context, list),
                        isLoading: isLoading,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectList(WidgetRef ref, BuildContext context, ListOfThings list) {
    ref.read(selectedListIdProvider.notifier).state = list.id;
    const ListItemsPageRoute().push(context);
    print(list);
  }

  Future<void> addNewList(WidgetRef ref, BuildContext context) async {
    ref.read(selectedListIdProvider.notifier).state = null;
    const AddOrEditListRoute().push(context);
  }
}
