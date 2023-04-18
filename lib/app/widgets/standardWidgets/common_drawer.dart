import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firebase_auth_provider.dart';
import 'package:listanything/app/navigation/routes/about_page_route.dart';
import 'package:listanything/app/navigation/routes/privacy_policy_page_route.dart';
import 'package:listanything/app/navigation/routes/profile_page_route.dart';
import 'package:listanything/app/navigation/routes/routes.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('List Anything'),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return IconButton(
                    onPressed: () async {
                      final auth = await ref.read(firebaseAuthProvider.future);
                      await auth.signOut();
                    },
                    icon: const Icon(Icons.logout),
                  );
                },
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          onTap: () {
            const ProfilePageRoute().push(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('About'),
          onTap: () {
            const AboutPageRoute().push(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.text_snippet_outlined),
          title: const Text('Privacy Policy'),
          onTap: () {
            const PrivacyPolicyPageRoute().push(context);
          },
        ),
      ],
    );
  }
}
