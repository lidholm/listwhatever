import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:listanything/app/common_theme_data.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/widgets/standardWidgets/app_bar_action.dart';
import 'package:listanything/app/widgets/standardWidgets/common_app_bar.dart';
import 'package:listanything/bootstrap.dart';

class CommonScaffold extends StatefulWidget {
  const CommonScaffold({
    required this.title,
    required this.body,
    this.titleWidget,
    this.actions,
    this.drawer,
    super.key,
  });
  final String? title;
  final Widget? titleWidget;
  final Widget body;
  final List<AppBarAction>? actions;
  final Drawer? drawer;

  @override
  State<CommonScaffold> createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends State<CommonScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: widget.title == null
          ? null
          : CommonAppBar(
              title: widget.title!,
              titleWidget: widget.titleWidget,
              actions: (widget.actions ?? [])
                ..addAll([
                  if (!kIsWeb && Platform.isAndroid && kDebugMode)
                    AppBarAction(
                      title: 'Take screenshot',
                      icon: Icons.screenshot,
                      key: const Key('takescreenshot'),
                      overflow: true,
                      callback: _takeScreenshot,
                    )
                ]),
            ),
      drawer: widget.drawer,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.5, -4),
            end: Alignment(0.1, 3.3),
            colors: [
              secondaryButtonColor,
              Colors.white,
              shadedMainColor,
            ],
          ),
        ),
        child: widget.body,
      ),
    );
  }

  // This function will be triggered when the button is pressed
  Future<void> _takeScreenshot() async {
    final boundary = repaintBoundaryKey.currentContext!.findRenderObject()
        as RenderRepaintBoundary?;

    final scaffoldMessengerState = ScaffoldMessenger.of(context);
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 1));

    final image = await boundary!.toImage();
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData != null) {
      final pngBytes = byteData.buffer.asUint8List();

      // Saving the screenshot to the gallery
      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(pngBytes),
        quality: 90,
        name: 'screenshot-${DateTime.now()}.png',
      );

      logger.d(result);

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      scaffoldMessengerState.showSnackBar(
        const SnackBar(
          content: Text('Took screenshot'),
        ),
      );
    }
  }
}
