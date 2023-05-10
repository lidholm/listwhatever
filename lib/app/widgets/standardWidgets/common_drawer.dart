import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/common_theme_data.dart';
import 'package:listanything/app/firebase/firebase_auth_provider.dart';
import 'package:listanything/app/navigation/current_user_provider.dart';
import 'package:listanything/app/navigation/routes/about_page_route.dart';
import 'package:listanything/app/navigation/routes/analytics_page_route.dart';
import 'package:listanything/app/navigation/routes/crashlytics_page_route.dart';
import 'package:listanything/app/navigation/routes/privacy_policy_page_route.dart';
import 'package:listanything/app/navigation/routes/profile_page_route.dart';
import 'package:listanything/app/navigation/routes/remote_config_page_route.dart';
import 'package:listanything/app/navigation/routes/routes.dart';
import 'package:listanything/app/navigation/routes/settings_page_route.dart';
import 'package:listanything/app/widgets/standardWidgets/async_value_widget.dart';

class CommonDrawer extends ConsumerWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(currentUserProvider),
      data: (firestoreUser) => ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: secondaryButtonColor,
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
            leading: const Icon(
              Icons.person,
              color: mainColor,
            ),
            title: const Text('Profile'),
            onTap: () {
              const ProfilePageRoute().push<void>(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: mainColor,
            ),
            title: const Text('About'),
            onTap: () {
              const AboutPageRoute().push<void>(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.text_snippet_outlined,
              color: mainColor,
            ),
            title: const Text('Privacy Policy'),
            onTap: () {
              const PrivacyPolicyPageRoute().push<void>(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: mainColor,
            ),
            title: const Text('Settings'),
            onTap: () {
              const SettingsPageRoute().push<void>(context);
            },
          ),
          if (firestoreUser?.isAdmin ?? false) ...[
            ListTile(
              leading: const Icon(
                Icons.local_fire_department_rounded,
                color: mainColor,
              ),
              title: const Text('Crashlytics'),
              onTap: () {
                const CrashlyticstPageRoute().push<void>(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.sync_alt,
                color: mainColor,
              ),
              title: const Text('Remote config'),
              onTap: () {
                const RemoteConfigPageRoute().push<void>(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.analytics,
                color: mainColor,
              ),
              title: const Text('Analytics'),
              onTap: () {
                const AnalyticsPageRoute().push<void>(context);
              },
            ),
          ],
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: mainColor,
            ),
            title: const Text('Log out'),
            onTap: () async {
              final auth = await ref.read(firebaseAuthProvider.future);
              await auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
