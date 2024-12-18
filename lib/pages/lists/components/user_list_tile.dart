import 'package:flutter/material.dart';
import 'package:listwhatever/components/shimmer/shimmer_loading.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';

const String className = 'UserListTile';

const imageRadius = 8.0;
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
    return buildTile(context);
  }

  Widget buildTile(BuildContext context) {
    return ShimmerLoading(
      isLoading: isLoading,
      child: Row(
        spacing: 8,
        children: [
          buildImage(),
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [buildTitle(context), buildSubtitle(context)],
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    if (isLoading) {
      return buildShimmerContainer(imageHeight, imageWidth);
    }
    return Image.asset(
      height: imageHeight,
      width: imageWidth,
      list.imageFilename ?? 'default',
      fit: BoxFit.cover,
    );
  }

  Widget buildTitle(BuildContext context) {
    if (isLoading) {
      return buildShimmerContainer(20, 160);
    }

    return Text(
      list.listName,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget buildSubtitle(BuildContext context) {
    if (isLoading) {
      return buildShimmerContainer(20, 140);
    }
    return Text(
      'Some',
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Widget buildShimmerContainer(double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(imageRadius),
      ),
    );
  }

  Widget sharedInfoWidget() {
    const topRightIconBorderColor = Colors.blue;
    const topRightIcon = Icon(Icons.abc);

    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
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
