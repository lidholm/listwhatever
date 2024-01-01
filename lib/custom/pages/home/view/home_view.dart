import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:allmylists/standard/app/app.dart';
import 'package:allmylists/standard/app/bloc/app_state.dart';
import 'package:allmylists/standard/appUi/widgets/app_logo.dart';
import 'package:allmylists/standard/appUi/widgets/show_app_modal.dart';
import 'package:allmylists/standard/navigation/navigation.dart';
import 'package:allmylists/standard/user_profile/user_profile.dart';
import 'package:allmylists/standard/view/login_modal.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AppBloc, AppState>(
          listenWhen: (previous, current) => previous.showLoginOverlay != current.showLoginOverlay,
          listener: (context, state) {
            if (state.showLoginOverlay) {
              showAppModal<void>(
                context: context,
                builder: (context) => const LoginModal(),
                routeSettings: const RouteSettings(name: LoginModal.name),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: AppLogo.dark(),
          centerTitle: true,
          actions: const [UserProfileButton()],
        ),
        drawer: const NavDrawer(),
        body: const Text('Home'),
      ),
    );
  }
}
