import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';

final counterProvider = StateProvider((ref) => 0);

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return CommonScaffold(
      title: 'Counter',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$count', style: Theme.of(context).textTheme.headline1),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).state = count + 1,
              child: const Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).state = count - 1,
              child: const Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}
