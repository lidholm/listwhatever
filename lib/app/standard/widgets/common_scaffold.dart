import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '/app/standard/helpers/constants.dart';
import '/app/standard/widgets/app_bar_action.dart';
import '/app/standard/widgets/common_app_bar.dart';
import '/bootstrap.dart';
import '/l10n/l10n.dart';

class CommonScaffold extends StatefulWidget {
  const CommonScaffold({
    required this.title,
    required this.body,
    this.titleWidget,
    this.actions,
    this.drawer,
    this.floatingActionButton,
    super.key,
  });
  final String? title;
  final Widget? titleWidget;
  final Widget body;
  final List<AppBarAction>? actions;
  final Drawer? drawer;
  final Widget? floatingActionButton;

  @override
  State<CommonScaffold> createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends State<CommonScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: widget.title == null
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          : CommonAppBar(
              title: widget.title!,
              titleWidget: widget.titleWidget,
              actions: (widget.actions ?? [])
                ..addAll([
                  if (!kIsWeb && Platform.isAndroid && kDebugMode)
                    AppBarAction(
                      title:
                          AppLocalizations.of(context).takeScreenshotMenuText,
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
            // image: DecorationImage(
            //   opacity: 0.85,
            //   alignment: Alignment(0.2, 0),
            //   image: AssetImage('assets/images/background.webp'),
            //   fit: BoxFit.cover,
            // ),
            ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, getTopPadding(), 0, 0),
          child: widget.body,
        ),
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }

  // This function will be triggered when the button is pressed
  Future<void> _takeScreenshot() async {
    final appLocalizations = AppLocalizations.of(context);
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
        SnackBar(
          content: Text(appLocalizations.tookScreenshotSnackbarText),
        ),
      );
    }
  }

  double getTopPadding() {
    if (widget.title == null) {
      return 0;
    }
    if (kIsWeb) {
      return 55;
    }
    if (Platform.isAndroid) {
      return 100;
    }
    if (Platform.isIOS) {
      return 100;
    }
    return 55;
  }
}
