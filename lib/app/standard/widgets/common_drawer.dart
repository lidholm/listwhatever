import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/app/custom/common_theme_data.dart';
import '/app/standard/firebase/firebase_auth_provider.dart';
import '/app/standard/navigation/current_user_provider.dart';
import '/app/standard/navigation/routes/profile_page_route.dart';
import '/app/standard/navigation/routes/routes.dart';
import '/app/standard/pages/about/about_page_route.dart';
import '/app/standard/pages/analytics/analytics_page_route.dart';
import '/app/standard/pages/crashlytics/crashlytics_page_route.dart';
import '/app/standard/pages/firebase_in_app_messaging/firebase_in_app_messaging_page_route.dart';
import '/app/standard/pages/firebase_performance/performance_page_route.dart';
import '/app/standard/pages/privacyPolicy/privacy_policy_page_route.dart';
import '/app/standard/pages/remoteConfig/remote_config_page_route.dart';
import '/app/standard/widgets/async_value_widget.dart';
import '/l10n/l10n.dart';
import '../navigation/routes/sign_in_page_route.dart';

class CommonDrawer extends ConsumerWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(currentUserProvider),
      data: (firestoreUser) => DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.9,
            alignment: Alignment(0.2, 0),
            image: AssetImage('assets/images/background.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(''),
                ],
              ),
            ),
            Container(
              height: 20,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.8)),
              child: const Text(''),
            ),
            Container(
              height: 8,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.6)),
              child: const Text(''),
            ),
            listItem(
              context,
              Icons.person,
              AppLocalizations.of(context).profileMenuText,
              () async {
                await const ProfilePageRoute().push<void>(context);
              },
            ),
            listItem(
              context,
              Icons.info,
              AppLocalizations.of(context).aboutMenuText,
              () async {
                await const AboutPageRoute().push<void>(context);
              },
            ),
            listItem(
              context,
              Icons.text_snippet_outlined,
              AppLocalizations.of(context).privacyProfileMenuText,
              () async {
                await const PrivacyPolicyPageRoute().push<void>(context);
              },
            ),
            listItem(
              context,
              Icons.local_fire_department_rounded,
              AppLocalizations.of(context).crashlyticsMenuText,
              () async {
                await const CrashlyticstPageRoute().push<void>(context);
              },
            ),
            listItem(
              context,
              Icons.sync_alt,
              AppLocalizations.of(context).remoteConfigMenuText,
              () async {
                await const RemoteConfigPageRoute().push<void>(context);
              },
            ),
            listItem(
              context,
              Icons.analytics,
              AppLocalizations.of(context).analyticsMenuText,
              () async {
                await const AnalyticsPageRoute().push<void>(context);
              },
            ),
            listItem(
              context,
              Icons.analytics,
              AppLocalizations.of(context).firebaseInAppMessaging,
              () async {
                await const FirebaseInAppMessagingPageRoute()
                    .push<void>(context);
              },
            ),
            listItem(
              context,
              Icons.analytics,
              AppLocalizations.of(context).firebasePerformanceTitle,
              () async {
                await const PerformancePageRoute().push<void>(context);
              },
            ),
            if (firestoreUser != null) ...[
              listItem(
                context,
                Icons.logout,
                AppLocalizations.of(context).logOutText,
                () async {
                  final auth = await ref.read(firebaseAuthProvider.future);
                  await auth.signOut();
                },
              ),
            ] else ...[
              listItem(
                context,
                Icons.login,
                AppLocalizations.of(context).logInText,
                () async {
                  await const SignInPageRoute().push<void>(context);
                },
              ),
            ],
            Container(
              height: 800,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.8)),
              child: const Text(''),
            )
          ],
        ),
      ),
    );
  }

  Widget listItem(
    BuildContext context,
    IconData icon,
    String text,
    Future<void> Function() onTap,
  ) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.8)),
      child: ListTile(
        leading: Icon(
          icon,
          color: mainColor,
        ),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
