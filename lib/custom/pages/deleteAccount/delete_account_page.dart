import 'package:flutter/material.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delete account',
        ),
      ),
      body: const Center(
        child: Text(
          'Delete account.\nContact deleteaccountallmylists@anywhostudios.com',
        ),
      ),
    );
  }
}
