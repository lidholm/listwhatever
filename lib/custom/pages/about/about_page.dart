import 'package:flutter/material.dart'; // hide Page;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context).aboutHeader)),
        body: Padding(
          padding: const EdgeInsets.all(80),
          child: Column(
            children: [
              Text(AppLocalizations.of(context).versionLabel('0.0.46+0000001')),
              Text(AppLocalizations.of(context).gitHashLabel('3d58f4d')),
              Text(AppLocalizations.of(context).aboutDateLabel('2024-11-02 21:01:33 PDT')),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
