import 'package:flutter/material.dart';
import 'package:listwhatever/pages/lists/components/user_list_tile.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';

const String className = 'ListTiles';

class ListTiles extends StatelessWidget {
  const ListTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final lists = List.generate(
      4,
      (i) => const UserList(
        id: 'id',
        listId: 'listId',
        listName: 'listName',
        imageFilename: 'assets/images/restaurants.jpeg',
        ownerId: 'ownerId',
        isOwnList: true,
      ),
    );

    // final listsState = context.watch<ListsLoadBloc>().state;
    // final firebaseStorage = context.watch<FirebaseStorageBloc>().state;

    // var lists = ShimmerHelper.generateShimmerUserLists(5);

    // const isLoading = false;
    // if (listsState is ListsLoadLoaded && firebaseStorage is FilesLoaded) {
    //   isLoading = false;
    //   lists = listsState.lists;
    //   images = firebaseStorage.imageUrls;
    // }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        children: List.generate(lists.length, (index) {
          final list = lists[index];
          return UserListTile(list: list, isLoading: index == 2);
        }),
      ),
    );
  }
}
