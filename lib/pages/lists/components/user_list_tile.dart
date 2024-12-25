import 'package:flutter/material.dart';
import 'package:listwhatever/components/shimmer/shimmer_container.dart';
import 'package:listwhatever/components/shimmer/shimmer_loading.dart';
import 'package:listwhatever/pages/list/routes/lists_page_route.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';
import 'package:listwhatever/routing/routes.dart';

const String className = 'UserListTile';

const imageRadius = 12.0;
const imageHeight = 80.0;
const imageWidth = 120.0;

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
    return ShimmerLoading(
      isLoading: isLoading,
      child: GestureDetector(
        onTap: () => onTap(context),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(imageRadius),
          ),
          child: Row(
            spacing: 24,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: buildImage(),
              ),
              Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [buildTitle(context), buildSubtitle(context)],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    if (isLoading) {
      return const ShimmerContainer(height: imageHeight, width: imageWidth);
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(imageRadius),
      child: Hero(
        tag: list.listName,
        child: Image.asset(
          height: imageHeight,
          width: imageWidth,
          list.imageFilename ?? 'default',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    if (isLoading) {
      return const ShimmerContainer(height: 20, width: 160);
    }

    return Text(
      list.listName,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget buildSubtitle(BuildContext context) {
    if (isLoading) {
      return const ShimmerContainer(height: 20, width: 140);
    }
    return Text(
      'Number of items: 14',
      style: Theme.of(context).textTheme.titleMedium,
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

  void onTap(BuildContext context) {
    ListPageRoute(actualListId: list.listId).push<void>(context);
  }
}
