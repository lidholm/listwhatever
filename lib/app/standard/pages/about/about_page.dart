import 'package:flutter/material.dart'; // hide Page;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/app/standard/widgets/common_scaffold.dart';
import '/l10n/l10n.dart';

class AboutPage extends ConsumerWidget {
  // implements Page {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: CommonScaffold(
        title: AppLocalizations.of(context).aboutHeader,
        body: Padding(
          padding: const EdgeInsets.all(80),
          child: Column(
            children: [
              Text(AppLocalizations.of(context).versionLabel('<version>')),
              Text(AppLocalizations.of(context).gitHashLabel('<git_hash>')),
              Text(AppLocalizations.of(context).aboutDateLabel('<datetime>')),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
