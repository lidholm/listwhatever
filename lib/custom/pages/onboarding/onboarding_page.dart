import 'package:flutter/material.dart'; // hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/standard/app/bloc/app_bloc.dart';
import 'package:listwhatever/standard/app/bloc/app_event.dart';

import '/l10n/l10n.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context).onboardingHeader)),
        body: Padding(
          padding: const EdgeInsets.all(80),
          child: Column(
            children: [
              OutlinedButton(
                  onPressed: () {
                    context.read<AppBloc>().add(const AppLogoutRequested());
                  },
                  child: Text('Log out')),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
