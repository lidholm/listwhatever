import 'package:flutter/material.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';

class LoadingUserPage extends StatelessWidget {
  const LoadingUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonScaffold(
      title: null,
      body: DecoratedBox(
        decoration: BoxDecoration(color: Colors.red),
        child: Center(
          child: Text('Loading!'),
        ),
      ),
    );
  }
}
