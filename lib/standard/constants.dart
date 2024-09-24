import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '/custom/pages/listItems/models/list_item.dart';

String defaultImageFilename = 'activities.png';

Logger logger = Logger(
  // printer: PrettyPrinter(methodCount: 0, printTime: true),
  printer: SimplePrinter(printTime: true),
  level: Level.debug,
  output: PrintLogOutput(),
  filter: ProductionFilter(),
);

class PrintLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (final line in event.lines) {
      print(line);
    }
  }
}

Iterable<(int, T)> mapIndexed<T>(
  Iterable<T> items,
) sync* {
  var index = 0;

  for (final item in items) {
    yield (index, item);
    index = index + 1;
  }
}

const _chars = 'AaBbCcDdEeFfGgHhiJjKkLMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
      ),
    );

extension DateTimeExtension on DateTime {
  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}

DateTime getCurrentDate() {
  final now = DateTime.now();
  final date = DateTime(now.year, now.month, now.day);
  return date;
}

enum DateFormatType { iso8601, us, monthAndDay }

String formatReadableDate(DateTime d, DateFormatType? type) {
  final diff = d.difference(DateTime.now());
  if (type == DateFormatType.iso8601) {
    return dateFormatter.format(d);
  }
  if (type == DateFormatType.us) {
    return usDateFormatter.format(d);
  }

  if (type == DateFormatType.monthAndDay) {
    if (diff > const Duration(days: 365)) {
      return monthAndDayFormatterWithYear.format(d);
    } else {
      return monthAndDayFormatter.format(d);
    }
  }
  throw Exception('Format for DateFormatType is not implemented yet');
}

final dateTimeFormatter = DateFormat('yyyy-MM-dd HH:mm');
final dateFormatter = DateFormat('yyyy-MM-dd');
final usDateFormatter = DateFormat.yMd();
final usDateTimeFormatter = DateFormat.yMd().add_jm();
final monthAndDayFormatter = DateFormat('MMMM d');
final monthAndDayFormatterWithYear = DateFormat('MMMM d, yyyy');
final timeFormatter = DateFormat('HH:mm');
final readableDateAndTimeFormatter = DateFormat('d MMM HH:mm');
final DateTime minDateTime = DateTime.utc(1900, 04, 20);
final DateTime maxDateTime = DateTime.utc(2100, 09, 13);

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

Map<String, Set<String>> getCategories(List<ListItem> items) {
  final categories = <String, Set<String>>{};

  for (final item in items) {
    for (final category in item.categories.entries) {
      final categoryName = category.key.trim();
      if (!categories.containsKey(categoryName)) {
        categories[categoryName] = {};
      }
      categories[categoryName]!.addAll(category.value.map((e) => e.trim()));
    }
  }
  return categories;
}

String doubleDigit(int num) {
  if (num < 10) {
    return '0$num';
  }
  return '$num';
}
