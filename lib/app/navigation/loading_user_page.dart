import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firebase_auth_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/app_bar_action.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';

class LoadingUserPage extends ConsumerWidget {
  const LoadingUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonScaffold(
      title: 'Loading',
      actions: [
        AppBarAction(
          title: 'Log out',
          icon: Icons.logout,
          callback: () async {
            final auth = await ref.read(firebaseAuthProvider.future);
            await auth.signOut();
          },
          overflow: false,
          key: const Key('logout'),
        )
      ],
      body: DecoratedBox(
        decoration: BoxDecoration(color: Colors.red.shade100),
        child: Center(
          child: Column(
            children: [
              Consumer(
                builder: (context, ref, child) => ElevatedButton(
                  onPressed: () async {
                    final auth = await ref.read(firebaseAuthProvider.future);
                    await auth.signOut();
                  },
                  child: const Text('Log out'),
                ),
              ),
              const Text('Loading!'),
            ],
          ),
        ),
      ),
    );
  }
}
