import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '/app/custom/pages/shareCode/share_code_page.dart';
import '/app/standard/firebase/current_user.dart';
import '/app/standard/navigation/current_user_provider.dart';
import '/app/standard/widgets/async_value_widget.dart';

@immutable
class ShareCodePageRoute extends GoRouteData {
  const ShareCodePageRoute({
    required this.publicListId,
    required this.shareCode,
  });
  final String publicListId;
  final String shareCode;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Consumer(
      builder: (context, ref, child) {
        return AsyncValueWidget<CurrentUser?>(
          value: ref.watch(currentUserProvider),
          data: (user) {
            final uid = user?.uid ?? 'no user or uid';
            if (user == null) {
              return const CircularProgressIndicator();
            }
            return ShareCodePage(
              userId: uid,
              publicListId: publicListId,
              shareCode: shareCode,
            );
          },
        );
      },
    );
  }
}
