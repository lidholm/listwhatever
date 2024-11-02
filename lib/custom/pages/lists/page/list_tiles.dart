import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:listwhatever/custom/pages/lists/models/list_type.dart';
import 'package:listwhatever/custom/pages/lists/models/user_list.dart';
import 'package:listwhatever/standard/appUi/colors/app_colors.dart';
import 'package:listwhatever/standard/appUi/theme/app_theme.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/widgets/imageButton/image_button.dart';

class ListTiles extends StatelessWidget {
  const ListTiles({
    required this.firebaseStorage,
    required this.lists,
    required this.userListContext,
    required this.onTap,
    super.key,
  });
  final FirebaseStorage firebaseStorage;
  final List<UserList> lists;
  final BuildContext userListContext;
  final void Function(String listId) onTap;

  @override
  Widget build(BuildContext context) {
    final crossAxisCount =
        kIsWeb ? (MediaQuery.of(context).size.width / 360).floor() : 2;

    // logger.d('lists: ${lists.length}');
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(
        slivers: [
          SliverGrid.count(
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: crossAxisCount,
            children: lists.map(
              (list) {
                final imageUrlFuture = firebaseStorage
                    .ref()
                    .child('images')
                    .child(list.imageFilename ?? defaultImageFilename)
                    .getDownloadURL();
                return FutureBuilder(
                  future: imageUrlFuture,
                  builder: (context, snapshot) {
                    final imageUrl = snapshot.data;
                    // logger.i('$className => imageUrl: $imageUrl');
                    return ImageButton<UserList>(
                      item: list,
                      imageUrl: imageUrl ?? '',
                      text: list.listName,
                      chipText: list.listType.readable(),
                      callback: (list) {
                        onTap(list.listId);
                      },
                      isLoading: imageUrl == null,
                      topRightIcon: list.isOwnList!
                          ? const Icon(
                              Icons.verified_user_outlined,
                              color: mainColor,
                            )
                          : const Icon(
                              Icons.supervised_user_circle,
                              color: AppColors.casablanca,
                            ),
                      topRightIconBorderColor: list.isOwnList!
                          ? const AppTheme().themeData.primaryColor
                          : AppColors.casablanca,
                    );
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
