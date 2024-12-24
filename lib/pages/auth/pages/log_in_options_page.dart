import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:listwhatever/auth/bloc/auth_bloc.dart';
import 'package:listwhatever/pages/auth/components/social_button.dart';

class LogInOptionsPage extends StatelessWidget {
  const LogInOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController(text: 'regular@email.com');
    final passwordController = TextEditingController(text: 'test1234!');

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
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => logInWithEmailAndPassword(
                    context,
                    emailController.text,
                    passwordController.text,
                  ),
                  child: const Text('Log in'),
                ),
                const SizedBox(height: 20),
                const Center(child: Text('or')),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      icon: HugeIcons.strokeRoundedApple,
                      onPressed: () => appleSignUp(context),
                    ),
                    const SizedBox(width: 20),
                    SocialButton(
                      icon: HugeIcons.strokeRoundedGoogle,
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
                        signUp(context);
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
    // GoRouter.of(context).goNamed(RouteName.signUp.value);
  }

  void logInWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
  ) {
    BlocProvider.of<AuthBloc>(context)
        .add(LoginWithEmailAndPassword(email: email, password: password));
  }

  void appleSignUp(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(SignUpWithApple());
  }

  void googleSignUp(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(SignUpWithGoogle());
  }
}
