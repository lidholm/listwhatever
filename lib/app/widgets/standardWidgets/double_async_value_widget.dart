import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoubleAsyncValueWidget<T, S> extends StatelessWidget {
  const DoubleAsyncValueWidget({
    super.key,
    required this.firstValue,
    required this.secondValue,
    required this.data,
  });
  final AsyncValue<T> firstValue;
  final AsyncValue<S> secondValue;
  final Widget Function(T, S) data;

  @override
  Widget build(BuildContext context) {
    return firstValue.when(
      data: (T t) {
        return secondValue.when(
          loading: loading,
          error: (e, st) => error(context, e, st),
          data: (S s) => data(t, s),
        );
      },
      loading: loading,
      error: (e, st) => error(context, e, st),
    );
  }

  Widget loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget error(BuildContext context, Object e, StackTrace st) => Center(
        child: Text(
          e.toString(),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.red),
        ),
      );
}
