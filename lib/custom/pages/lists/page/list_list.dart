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
import 'package:listwhatever/standard/firebase/firebaseStorageBloc/bloc/firebase_storage_bloc.dart';
import 'package:listwhatever/standard/helpers/logger_helper.dart';
import 'package:listwhatever/standard/helpers/shimmer_helper.dart';
import 'package:listwhatever/standard/widgets/imageButton/image_button.dart';
import 'package:listwhatever/standard/widgets/shimmer/shimmer_loading.dart';

const String className = 'ListList';

class ListList extends StatelessWidget {
  const ListList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final listsState = context.watch<ListsLoadBloc>().state;
    final firebaseStorage = context.watch<FirebaseStorageBloc>().state;

    var lists = ShimmerHelper.generateShimmerUserLists(5);

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
            SliverList.list(
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
    LoggerHelper.logger
      ..i('$className: list.listName: ${list.listName}')
      ..i('$className: list.imageFilename: ${list.imageFilename}')
      ..i('$className: list.isOwnList: ${list.isOwnList}');

    const textStyle = TextStyle(fontSize: 14, color: Colors.grey);
    return GestureDetector(
      onTap: () => onTap(context, list.listId),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            imageWidget(images[list.imageFilename ?? 'default']),
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
  }

  Widget imageWidget(String? imageUrl) {
    // LoggerHelper.logger.i('$className: imageUrl: $imageUrl');

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
