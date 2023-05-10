import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firebase_remote_config_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/async_value_widget.dart';

class RemoteConfigPage extends ConsumerWidget {
  const RemoteConfigPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(firebaseRemoteConfigProvider),
      data: (remoteConfig) => Scaffold(
        appBar: AppBar(
          title: const Text('Remote Config Example'),
        ),
        body: Column(
          children: [
            _ButtonAndText(
              defaultText: 'No data',
              onPressed: () async {
                try {
                  // Using zero duration to force fetching from remote server.
                  await remoteConfig.setConfigSettings(
                    RemoteConfigSettings(
                      fetchTimeout: const Duration(seconds: 10),
                      minimumFetchInterval: Duration.zero,
                    ),
                  );
                  await remoteConfig.fetchAndActivate();
                  return 'Fetched: ${remoteConfig.getString('welcome')}';
                } on PlatformException catch (exception) {
                  // Fetch exception.
                  print(exception);
                  return 'Exception: $exception';
                } catch (exception) {
                  print(exception);
                  return 'Unable to fetch remote config. Cached or default values will be '
                      'used';
                }
              },
              buttonText: 'Fetch Activate',
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonAndText extends StatefulWidget {
  const _ButtonAndText({
    required this.defaultText,
    required this.onPressed,
    required this.buttonText,
  });

  final String defaultText;
  final String buttonText;
  final Future<String> Function() onPressed;

  @override
  State<_ButtonAndText> createState() => _ButtonAndTextState();
}

class _ButtonAndTextState extends State<_ButtonAndText> {
  String? _text;

  // Update text when widget is updated.
  @override
  void didUpdateWidget(covariant _ButtonAndText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.defaultText != oldWidget.defaultText) {
      setState(() {
        _text = widget.defaultText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Text(_text ?? widget.defaultText),
          const Spacer(),
          ElevatedButton(
            onPressed: () async {
              final result = await widget.onPressed();
              setState(() {
                _text = result;
              });
            },
            child: Text(widget.buttonText),
          ),
        ],
      ),
    );
  }
}
