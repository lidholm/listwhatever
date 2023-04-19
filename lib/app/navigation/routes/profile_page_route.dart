import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/firebase/firebase_auth_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/async_value_widget.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';

@immutable
class ProfilePageRoute extends GoRouteData {
  const ProfilePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Consumer(
      builder: (context, ref, child) => AsyncValueWidget<FirebaseAuth>(
        value: ref.watch(firebaseAuthProvider),
        data: (auth) => CommonScaffold(
          title: 'Profile',
          body: ProfileScreen(auth: auth),
        ),
      ),
    );
  }
}
