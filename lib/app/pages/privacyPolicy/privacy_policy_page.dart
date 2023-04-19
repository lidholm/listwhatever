import 'package:flutter/material.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonScaffold(
      title: 'Privacy Policy',
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Text('Privacy policy'),
      ),
    );
  }
}
