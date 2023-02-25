import 'package:flutter/material.dart'; // hide Page;
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kennelklubben/app/pages/menu_item_holder.dart';
// import 'package:kennelklubben/app/pages/page.dart';

class AboutPage extends ConsumerWidget {
  // implements Page {
  const AboutPage({super.key});

  // @override
  // Widget getTitle() {
  //   return Text('About');
  // }

  // @override
  // List<MenuItemHolder> getPopUpMenuItems(BuildContext context, WidgetRef ref) {
  //   return <MenuItemHolder>[];
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: const [
          Text('Version: <version>'),
          Text('Git hash: <git_hash>'),
          Text('Date: <datetime>'),
          Divider(),
        ],
      ),
    );
  }
}
