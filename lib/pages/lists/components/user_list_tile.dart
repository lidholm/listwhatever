import 'package:flutter/material.dart';
import 'package:listwhatever/components/shimmer/shimmer_loading.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';

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
    return buildTile(context);
  }

  Widget buildTile(BuildContext context) {
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
      return buildShimmerContainer(imageHeight, imageWidth);
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
      'Number of items: 14',
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

  void onTap(BuildContext context) {
    // context.read<FilterBloc>().add(UpdateFiltersForSelectedList(listId));
    // ListItemsPageRoute(actualListId: listId).push<void>(context);
    // GoRouter.of(context).pushNamed(RouteName.list.value);
  }
}
