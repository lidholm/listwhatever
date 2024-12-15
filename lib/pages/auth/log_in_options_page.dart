import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:listwhatever/auth/bloc/auth_bloc.dart';
import 'package:listwhatever/pages/auth/social_button.dart';
import 'package:listwhatever/routing/go_router_configuration.dart';

class LogInOptionsPage extends StatelessWidget {
  const LogInOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => signUp(context),
                  child: const Text('Log in'),
                ),
                const SizedBox(height: 20),
                const Center(child: Text('or')),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      icon: Icons.apple,
                      onPressed: () => appleSignUp(context),
                    ),
                    const SizedBox(width: 20),
                    SocialButton(
                      icon: Bootstrap.google,
                      onPressed: () => googleSignUp(context),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).goNamed(RouteName.signUp.value);
                      },
                      child: const Text('Sign up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp(BuildContext context) {
    GoRouter.of(context).goNamed(RouteName.signUp.value);
  }

  void appleSignUp(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(SignUpWithApple());
  }

  void googleSignUp(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(SignUpWithGoogle());
  }
}
