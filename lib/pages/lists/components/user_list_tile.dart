import 'package:flutter/material.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';

const String className = 'UserListTile';

const roundedRadius = 4.0;
const background = Colors.green;
const imageRadius = 8.0;
const height = 80.0;

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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        tileColor: Colors.brown.shade100,
        minTileHeight: height,
        leading: Image.asset(
          list.imageFilename ?? 'default',
          fit: BoxFit.fitHeight,
        ),
        title: Text(
          list.listName,
          style: TextStyle(color: Colors.red),
        ),
        subtitle: Text('Some', style: TextStyle(color: Colors.green)),
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
