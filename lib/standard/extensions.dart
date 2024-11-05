import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension Let<T> on T? {
  void let(void Function(T) block) {
    if (this != null) {
      // ignore: null_check_on_nullable_type_parameter
      block(this!);
    }
  }
}

extension MyIterable<E> on Iterable<E> {
  // ignore: strict_raw_type
  Iterable<E> sortedBy(Comparable Function(E e) key) =>
      toList()..sort((a, b) => key(a).compareTo(key(b)));
}

extension GoRouterStateExtension on GoRouterState {
  // ignore: strict_raw_type
  String debugString() =>
      'GoRouterState: name: $name,  path: $path, fullPath: $fullPath, pathParams: $pathParameters, extra: $extra, matchedLocation: $matchedLocation\n'
      'uri: ${uri.path} ${uri.queryParameters} ${uri.query} ${uri.data} ${uri.userInfo}';
}

extension DateTimeExtension on DateTime {
  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}
