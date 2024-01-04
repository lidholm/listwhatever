import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '/standard/bloc/login_bloc.dart';
import '/standard/userRepository/user_repository.dart';
import '/standard/widgets/appBar/app_bar_action.dart';
import '/standard/widgets/appBar/app_bar_action_icon.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import '/standard/widgets/login_with_email_and_password_form.dart';

class LoginWithEmailAndPasswordPage extends StatelessWidget {
  const LoginWithEmailAndPasswordPage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(builder: (_) => const LoginWithEmailAndPasswordPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(
        userRepository: context.read<UserRepository>(),
      ),
      child: Scaffold(
        appBar: CommonAppBar(
          // leading: const AppBackButton(),
          title: '',
          actions: [
            AppBarAction(
              type: AppBarActionType.icon,
              iconAction: AppBarActionIcon(
                callback: () => GoRouter.of(context).pop(),
                title: 'Close',
                icon: Icons.close,
                key: const Key('loginWithEmailPage_closeIcon'),
              ),
            ),
          ],
        ),
        body: const LoginWithEmailAndPasswordForm(),
      ),
    );
  }
}
