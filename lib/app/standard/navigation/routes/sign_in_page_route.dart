import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '/app/standard/firebase/firebase_auth_provider.dart';
import '/app/standard/widgets/async_value_widget.dart';

@immutable
class SignInPageRoute extends GoRouteData {
  const SignInPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Consumer(
      builder: (context, ref, child) {
        return AsyncValueWidget<FirebaseAuth>(
          value: ref.watch(firebaseAuthProvider),
          data: (auth) => SignInScreen(
            auth: auth,
            providers: FirebaseUIAuth.providersFor(
              auth.app,
            ),
          ),
        );
      },
    );
  }
}
