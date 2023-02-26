import 'package:flutter/material.dart';

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget({super.key, required this.e, required this.st});
  final Object e;
  final StackTrace st;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        e.toString(),
        style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.red),
      ),
    );
  }
}
