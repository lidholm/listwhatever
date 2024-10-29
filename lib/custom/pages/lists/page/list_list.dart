import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:listwhatever/custom/navigation/routes.dart';
import 'package:listwhatever/custom/pages/listItems/route/list_items_page_route.dart';
import 'package:listwhatever/custom/pages/lists/models/list_type.dart';
import 'package:listwhatever/custom/pages/lists/models/user_list.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/widgets/imageButton/image_button.dart';

const String className = 'ListList';

class ListList extends StatelessWidget {
  const ListList({
    required this.firebaseStorage,
    required this.lists,
    required this.userListContext,
    super.key,
  });
  final FirebaseStorage firebaseStorage;
  final List<UserList> lists;
  final BuildContext userListContext;

  @override
  Widget build(BuildContext context) {
    // logger.d('lists: ${lists.length}');
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(
        slivers: [
          SliverList.list(
            children: lists.map(_buildItem).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(UserList list) {
    logger
      ..i('$className: list.listName: ${list.listName}')
      ..i('$className: list.imageFilename: ${list.imageFilename}')
      ..i('$className: list.isOwnList: ${list.isOwnList}');

    final imageUrlFuture = firebaseStorage
        .ref()
        .child('images')
        .child(list.imageFilename ?? defaultImageFilename)
        .getDownloadURL();

    return FutureBuilder(
      future: imageUrlFuture,
      builder: (context, snapshot) {
        final imageUrl = snapshot.data;

        const textStyle = TextStyle(fontSize: 14, color: Colors.grey);
        return GestureDetector(
          onTap: () {
            ListItemsPageRoute(actualListId: list.listId)
                .push<void>(userListContext);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                imageWidget(imageUrl),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list.listName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(list.listType.readable(), style: textStyle),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text('•', style: textStyle),
                          ),
                          // TODO: Should it say Private, Shared with others, Shared with me (or something similar)
                          Text(
                            (list.isOwnList ?? false) ? 'Private' : 'Shared',
                            style: textStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget imageWidget(String? imageUrl) {
    // logger.i('$className: imageUrl: $imageUrl');

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(imageRadius),
          child: SizedBox(
            width: 80,
            child: (imageUrl == null)
                ? Container()
                : Image.network(imageUrl, fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
