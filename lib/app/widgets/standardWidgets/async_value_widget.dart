import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/widgets/standardWidgets/exception_widget.dart';

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
          children: const [
            Text('Loading'),
            CircularProgressIndicator(),
          ],
        ),
      ),
      error: (e, st) {
        return ExceptionWidget(e: e, st: st);
      },
    );
  }
}
