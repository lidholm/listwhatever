import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/app/standard/widgets/exception_widget.dart';
import '/l10n/l10n.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    required this.value,
    required this.data,
    super.key,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => Center(
        child: Column(
          children: [
            Text(AppLocalizations.of(context).loadingText),
            const CircularProgressIndicator(),
          ],
        ),
      ),
      error: (e, st) {
        return ExceptionWidget(e: e, st: st);
      },
    );
  }
}
