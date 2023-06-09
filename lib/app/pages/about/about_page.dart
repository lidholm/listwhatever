import 'package:flutter/material.dart'; // hide Page;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';

class AboutPage extends ConsumerWidget {
  // implements Page {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SafeArea(
      child: CommonScaffold(
        title: 'About',
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Text('Version: <version>'),
              Text('Git hash: <git_hash>'),
              Text('Date: <datetime>'),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
