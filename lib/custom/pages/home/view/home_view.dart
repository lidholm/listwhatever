import 'package:flutter/material.dart';

import '/standard/appUi/widgets/app_logo.dart';
import '/standard/navigation/view/nav_drawer.dart';
import '/standard/user_profile/widgets/user_profile_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppLogo.dark(),
        centerTitle: true,
        actions: const [UserProfileButton()],
      ),
      drawer: const NavDrawer(),
      body: const Text('Home'),
    );
  }
}
