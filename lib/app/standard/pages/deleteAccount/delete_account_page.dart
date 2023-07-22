import 'package:flutter/material.dart';
import '/app/standard/widgets/common_scaffold.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonScaffold(
      title: 'Delete account',
      body: Center(
        child: Text(
          'Delete account.\nContact deleteaccount-listanything@anywhostudios.com',
        ),
      ),
    );
  }
}
