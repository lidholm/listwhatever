import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '/app/standard/firebase/firebase_auth_provider.dart';
import '/l10n/l10n.dart';

@immutable
class ErrorLoadingUserRoute extends GoRouteData {
  const ErrorLoadingUserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Consumer(
      builder: (context, ref, child) => Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final auth = await ref.read(firebaseAuthProvider.future);
              await auth.signOut();
            },
            child: const Text('Log out'),
          ),
          Text(AppLocalizations.of(context).errorLoadingUserText)
        ],
      ),
    );
  }
}
