import 'package:flutter/material.dart';
import 'package:listwhatever/standard/widgets/appBar/common_app_bar.dart';

import 'app_bar_action.dart';

const className = 'ImageBackgroundCommonAppBar';

class ImageBackgroundCommonAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ImageBackgroundCommonAppBar({
    required this.title,
    required this.imageUrl,
    this.actions = const <AppBarAction<dynamic>>[],
    this.toolbarHeight = 56,
    super.key,
  });

  final double toolbarHeight;
  final String title;
  final String? imageUrl;
  final List<AppBarAction<dynamic>> actions;

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    //

    ImageProvider<Object> image =
        const AssetImage('assets/images/background.webp');

    if (imageUrl != null) {
      image = NetworkImage(imageUrl!);
    }

    return CommonAppBar(
      toolbarHeight: toolbarHeight,
      titleWidget: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.7),
              BlendMode.lighten,
            ),
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      actions: actions,
      title: '',
    );
  }
}
