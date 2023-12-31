import 'package:flutter/material.dart';
import 'package:listanything/standard/widgets/appBar/common_app_bar.dart';
import 'package:listanything/standard/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CommonAppBar(title: 'Login'),
        body: LoginForm());
  }
}
