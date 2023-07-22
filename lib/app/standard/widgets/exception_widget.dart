import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '/app/standard/widgets/common_app_bar.dart';

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget({
    required this.e,
    required this.st,
    super.key,
  });
  final Object e;
  final StackTrace st;

  @override
  Widget build(BuildContext context) {
    final error = (e is Tuple2) ? (e as Tuple2).item1 as Object : e;
    final extraInfo = (e is Tuple2) ? (e as Tuple2).item2 as String? : null;
    return Scaffold(
      appBar: const CommonAppBar(title: 'Error'),
      body: Center(
        child: Column(
          children: [
            Text(
              error.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.red),
            ),
            const SizedBox(height: 16),
            Text(
              extraInfo ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.red),
            ),
            const SizedBox(height: 16),
            Text(
              st.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
