import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/custom/navigation/routes.dart';
import 'package:listwhatever/custom/pages/listItems/filters/bloc/filter_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/filters/bloc/filter_event.dart';
import 'package:listwhatever/custom/pages/listItems/route/list_items_page_route.dart';
import 'package:listwhatever/custom/pages/lists/lists_load_events/lists_bloc.dart';
import 'package:listwhatever/custom/pages/lists/lists_load_events/lists_state.dart';
import 'package:listwhatever/custom/pages/lists/models/list_type.dart';
import 'package:listwhatever/custom/pages/lists/models/user_list.dart';
import 'package:listwhatever/standard/appUi/colors/app_colors.dart';
import 'package:listwhatever/standard/appUi/theme/app_theme.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/firebase/firebaseStorageBloc/bloc/firebase_storage_bloc.dart';
import 'package:listwhatever/standard/widgets/imageButton/image_button.dart';
import 'package:listwhatever/standard/widgets/shimmer/shimmer_loading.dart';

const String className = 'ListTiles';

class ListTiles extends StatelessWidget {
  const ListTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final crossAxisCount =
        kIsWeb ? (MediaQuery.of(context).size.width / 360).floor() : 2;

    final listsState = context.watch<ListsLoadBloc>().state;
    final firebaseStorage = context.watch<FirebaseStorageBloc>().state;

    var lists = generateShimmerUserLists(5); // TODO: Break out to ShimmerHelper

    var isLoading = true;
    var images = <String, String>{};
    if (listsState is ListsLoadLoaded && firebaseStorage is FilesLoaded) {
      isLoading = false;
      lists = listsState.lists;
      images = firebaseStorage.imageUrls;
    }

    return ShimmerLoading(
      isLoading: isLoading,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverGrid.count(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: crossAxisCount,
              children: lists
                  .map(
                    (list) => isLoading
                        ? _buildShimmerItem()
                        : _buildItem(context, list, images),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    UserList list,
    Map<String, String> images,
  ) {
    final imageUrl = images[list.imageFilename ?? 'default'] ?? 'default.png';

    return ImageButton<UserList>(
      item: list,
      imageUrl: imageUrl,
      text: list.listName,
      chipText: list.listType.readable(),
      callback: (list) {
        onTap(context, list.listId);
      },
      isLoading: false,
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
  }

  Widget _buildShimmerItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  void onTap(BuildContext context, String listId) {
    context.read<FilterBloc>().add(UpdateFiltersForSelectedList(listId));
    ListItemsPageRoute(actualListId: listId).push<void>(context);
  }
}
