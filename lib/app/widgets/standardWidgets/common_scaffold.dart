import 'package:flutter/material.dart';
import 'package:listanything/app/widgets/standardWidgets/app_bar_action.dart';
import 'package:listanything/app/widgets/standardWidgets/common_app_bar.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({
    super.key,
    required this.title,
    this.titleWidget,
    required this.body,
    this.actions,
    this.drawer,
  });
  final String? title;
  final Widget? titleWidget;
  final Widget body;
  final List<AppBarAction>? actions;
  final Drawer? drawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title == null
          ? null
          : CommonAppBar(
              title: title!,
              titleWidget: titleWidget,
              actions: actions ?? [],
            ),
      drawer: drawer,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(-0.2, -2.5),
            end: const Alignment(0.1, 3.3),
            colors: [
              const Color.fromARGB(255, 252, 182, 51),
              Colors.white,
              Colors.blue[400]!,
            ],
          ),
        ),
        child: body,
      ),
    );
  }
}
