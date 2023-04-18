import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/shareList/share_list_page.dart';

@immutable
class ShareListPageRoute extends GoRouteData {
  const ShareListPageRoute({required this.publicListId});
  final String publicListId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ShareListPage(publicListId: publicListId);
  }
}
