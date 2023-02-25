import 'package:flutter/material.dart';

class LoadingUserPage extends StatelessWidget {
  const LoadingUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.red),
        child: const Center(
          child: Text('Loading!'),
        ),
      ),
    );
  }
}
