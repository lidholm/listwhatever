import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/custom/pages/deleteAccount/delete_account_page.dart';

@immutable
class DeleteAccountPageRoute extends GoRouteData {
  const DeleteAccountPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DeleteAccountPage();
  }
}
