import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:logger/logger.dart';

import '/app/custom/common_theme_data.dart';
import '/app/custom/geocoder/latlong.dart';
import '/app/custom/pages/settings/settings.dart';
import '/app/standard/widgets/custom_exception.dart';

final navKey = GlobalKey<NavigatorState>();

class ConsoleAndFileOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (final line in event.lines) {
      print(line);
    }
  }
}

class MyPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return ['${event.time} ${event.level}  ${event.message}'];
  }
}

final logger = Logger(
  // printer: PrettyPrinter(
  //     methodCount: 1, // number of method calls to be displayed
  //     errorMethodCount: 2, // number of method calls if stacktrace is provided
  //     lineLength: 120, // width of the output
  //     colors: true, // Colorful log messages
  //     printEmojis: true, // Print an emoji for each log message
  //     printTime: true // Should each log print contain a timestamp
  //     ),
  printer: MyPrinter(),
  output: ConsoleAndFileOutput(),
  level: Level.debug,
);

Iterable<MapEntry<int, T>> mapIndexed<T>(
  Iterable<T> items,
) sync* {
  var index = 0;

  for (final item in items) {
    yield MapEntry(index, item);
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

String formatReadableDate(DateTime d, DateFormatType? type) {
  final diff = d.difference(DateTime.now());
  if (type == DateFormatType.ISO_8601) {
    return dateFormatter.format(d);
  }
  if (type == DateFormatType.US) {
    return usDateFormatter.format(d);
  }

  if (type == DateFormatType.MONTH_AND_DAY) {
    if (diff > const Duration(days: 365)) {
      return monthAndDayFormatterWithYear.format(d);
    } else {
      return monthAndDayFormatter.format(d);
    }
  }
  throw const CustomException(
    message: 'Format for DateFormatType is not implemented yet',
  );
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

extension LatLongExtension on LatLong {
  LatLng toLatLng() {
    return LatLng(lat, lng);
  }
}

extension MyIterable<E> on Iterable<E> {
  // ignore: strict_raw_type
  Iterable<E> sortedBy(Comparable Function(E e) key) =>
      toList()..sort((a, b) => key(a).compareTo(key(b)));
}

const baseColors = [
  Color.fromRGBO(76, 76, 76, 1),
  Color.fromRGBO(227, 227, 227, 1),
  Color.fromRGBO(250, 187, 169, 1),
  Color.fromRGBO(251, 221, 133, 1),
  Color.fromRGBO(158, 210, 161, 1),
  Color.fromRGBO(157, 206, 246, 1),
  Color.fromRGBO(167, 140, 216, 1),
  Color.fromRGBO(241, 144, 177, 1),
];
int getAdjustedIndex(int index) {
  return index % baseColors.length;
}

Color getSectionColor(int index) {
  return baseColors[getAdjustedIndex(index)];
}

TextSpan header(String text, {bool noNewLine = false}) {
  return TextSpan(
    text: noNewLine ? text : '$text\n\n',
    style: h1style,
  );
}

TextSpan header2(String text, {bool noNewLine = false}) {
  return TextSpan(
    text: noNewLine ? text : '$text\n\n',
    style: h2style,
  );
}

TextSpan header3(String text, {bool noNewLine = false}) {
  return TextSpan(
    text: noNewLine ? text : '$text\n\n',
    style: h3style,
  );
}

TextSpan regularText(String text, {bool noNewLine = false}) {
  return TextSpan(
    text: noNewLine ? text : '$text\n\n',
    style: regularStyle,
  );
}

TextSpan boldText(String text) {
  return TextSpan(
    text: text,
    style: boldStyle,
  );
}

TextSpan italicText(String text) {
  return TextSpan(
    text: text,
    style: italicStyle,
  );
}
