import 'package:flutter/foundation.dart';
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
    final crossAxisCount =
        kIsWeb ? (MediaQuery.of(context).size.width / 360).floor() : 2;

    final lists = List.generate(
      4,
      (i) => const UserList(
        id: 'id',
        listId: 'listId',
        listName: 'listName',
        imageFilename: 'imageFilename',
        ownerId: 'ownerId',
        isOwnList: true,
      ),
    );

    // final listsState = context.watch<ListsLoadBloc>().state;
    // final firebaseStorage = context.watch<FirebaseStorageBloc>().state;

    // var lists = ShimmerHelper.generateShimmerUserLists(5);

    const isLoading = false;
    // if (listsState is ListsLoadLoaded && firebaseStorage is FilesLoaded) {
    //   isLoading = false;
    //   lists = listsState.lists;
    //   images = firebaseStorage.imageUrls;
    // }

    return
        // ShimmerLoading(
        //   isLoading: isLoading,
        //   child:
        Padding(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(
        slivers: [
          SliverGrid.count(
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: crossAxisCount,
            children: lists
                .map(
                  (list) => UserListTile(list: list, isLoading: isLoading),
                )
                .toList(),
          ),
        ],
      ),
      // ),
    );
  }

  void onTap(BuildContext context, String listId) {
    // context.read<FilterBloc>().add(UpdateFiltersForSelectedList(listId));
    // ListItemsPageRoute(actualListId: listId).push<void>(context);
  }
}
