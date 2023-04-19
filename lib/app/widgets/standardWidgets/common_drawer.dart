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
          decoration: BoxDecoration(
            color: Colors.orange[800],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'List Anything',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.person,
            color: Colors.orange[800],
          ),
          title: const Text('Profile'),
          onTap: () {
            const ProfilePageRoute().push(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.info,
            color: Colors.orange[800],
          ),
          title: const Text('About'),
          onTap: () {
            const AboutPageRoute().push(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.text_snippet_outlined,
            color: Colors.orange[800],
          ),
          title: const Text('Privacy Policy'),
          onTap: () {
            const PrivacyPolicyPageRoute().push(context);
          },
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.orange[800],
              ),
              title: const Text('Log out'),
              onTap: () async {
                final auth = await ref.read(firebaseAuthProvider.future);
                await auth.signOut();
              },
            );
          },
        ),
      ],
    );
  }
}
