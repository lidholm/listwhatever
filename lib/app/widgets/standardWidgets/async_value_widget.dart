import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({super.key, required this.value, required this.data});
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
      error: (e, st) => Center(
        child: Text(
          e.toString(),
          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.red),
        ),
      ),
    );
  }
}
