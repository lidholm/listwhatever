import 'package:flutter/material.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';

class LoadingUserPage extends StatelessWidget {
  const LoadingUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: null,
      body: Container(
        decoration: const BoxDecoration(color: Colors.red),
        child: const Center(
          child: Text('Loading!'),
        ),
      ),
    );
  }
}
