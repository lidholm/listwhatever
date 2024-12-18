import 'package:flutter/material.dart';
import 'package:listwhatever/components/shimmer/shimmer_loading.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';

const String className = 'UserListTile';

const roundedRadius = 4.0;
const background = Colors.green;
const imageRadius = 8.0;
const height = 80.0;
const imageHeight = 60.0;
const imageWidth = 80.0;

class UserListTile extends StatelessWidget {
  const UserListTile({
    required this.list,
    required this.isLoading,
    super.key,
  });
  final UserList list;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading ? buildShimmer() : buildTile();
  }

  Widget buildTile() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        tileColor: Colors.brown.shade100,
        minTileHeight: height,
        leading: Image.asset(
          height: imageHeight,
          width: imageWidth,
          list.imageFilename ?? 'default',
          fit: BoxFit.fitHeight,
        ),
        title: Text(
          list.listName,
          style: TextStyle(color: Colors.blue),
        ),
        subtitle: Text('Some', style: TextStyle(color: Colors.green)),
      ),
    );
  }

  Widget buildShimmer() {
    return ShimmerLoading(
      isLoading: true,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          tileColor: Colors.brown.shade100,
          minTileHeight: height,
          leading: Container(
            height: imageHeight,
            width: imageWidth,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          title: Container(
            width: 80,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          subtitle: Container(
            width: 30,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }

  Widget sharedInfoWidget() {
    const topRightIconBorderColor = Colors.blue;
    const topRightIcon = Icon(Icons.abc);

    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: background,
        border: Border.all(
          color: topRightIconBorderColor,
          width: 4,
        ),
      ),
      child: IconButton(
        icon: topRightIcon,
        onPressed: () {},
      ),
    );
  }

  void onTap(BuildContext context, String listId) {
    // context.read<FilterBloc>().add(UpdateFiltersForSelectedList(listId));
    // ListItemsPageRoute(actualListId: listId).push<void>(context);
  }
}
