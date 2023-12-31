import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/custom/pages/shareList/share_list_page.dart';

@immutable
class ShareListPageRoute extends GoRouteData {
  const ShareListPageRoute(this.listId);
  final String listId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ShareListPage(listId: listId);
  }
}
