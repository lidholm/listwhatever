import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:listwhatever/custom/pages/lists/models/list_type.dart';
import 'package:listwhatever/custom/pages/lists/models/user_list.dart';
import 'package:listwhatever/standard/appUi/colors/app_colors.dart';
import 'package:listwhatever/standard/appUi/theme/app_theme.dart';
import 'package:listwhatever/standard/widgets/imageButton/image_button.dart';

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
            children: lists.map(
              (list) {
                final imageUrlFuture = firebaseStorage
                    .ref()
                    .child('images')
                    .child(list.imageFilename)
                    .getDownloadURL();
                return FutureBuilder(
                  future: imageUrlFuture,
                  builder: (context, snapshot) {
                    final imageUrl = snapshot.data;
                    // logger.i('$this => imageUrl: $imageUrl');
                    return ListTile(
                      leading: imageWidget(imageUrl ?? ''),
                      title: Text(
                        list.listName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: [
                          typeWidget(list.listType.readable()),
                          const Spacer(),
                          sharedInfoWidget(
                            list.isOwnList!
                                ? const Icon(
                                    Icons.verified_user_outlined,
                                    color: mainColor,
                                  )
                                : const Icon(
                                    Icons.supervised_user_circle,
                                    color: AppColors.casablanca,
                                  ),
                            list.isOwnList!
                                ? const AppTheme().themeData.primaryColor
                                : AppColors.casablanca,
                          ),
                        ],
                      ),
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

  Widget typeWidget(String? chipText) {
    if (chipText == null) {
      return Container();
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Text(chipText, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget imageWidget(String imageUrl) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(imageRadius),
          child: SizedBox(
            width: 60,
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
        );
      },
    );
  }

  Widget sharedInfoWidget(Widget icon, Color iconBorderColor) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: background,
        border: Border.all(
          color: iconBorderColor,
          width: 4,
        ),
      ),
      child: IconButton(
        icon: icon,
        onPressed: () {},
      ),
    );
  }
}
