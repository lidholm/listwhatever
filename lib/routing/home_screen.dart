import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/auth/bloc/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => context.go('/details'),
              child: const Text('Go to the Details screen'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/tabbar'),
              child: const Text('Go to the Tab bar screen'),
            ),
            ElevatedButton(
              onPressed: () => BlocProvider.of<AuthBloc>(context).add(Logout()),
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
