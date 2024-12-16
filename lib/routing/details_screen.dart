import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen w')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go back to the Home screen'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/unknown'),
              child: const Text('Go to unknown page'),
            ),
          ],
        ),
      ),
    );
  }
}
