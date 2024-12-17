import 'package:flutter/material.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';

const String className = 'UserListTile';
const roundedRadius = 8.0;
const background = Colors.red;
const imageRadius = 8.0;

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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero, // Set this
        padding: EdgeInsets.zero, // and this
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(roundedRadius),
        ),
        backgroundColor: Colors.white,
      ),
      onPressed: () {
        // callback.call(item);
      },
      child: backgroundWidget(
        child: Column(
          children: [
            imageWidget(),
            headerWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  sharedInfoWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DecoratedBox backgroundWidget({required Widget child}) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }

  Widget imageWidget() {
    final imageUrl = list.imageFilename ?? 'default';
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(imageRadius),
            child: SizedBox(
              width: constraints.maxWidth * 0.9,
              height: constraints.maxWidth * 0.6,
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }

  Text headerWidget() {
    return Text(
      list.listName,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
