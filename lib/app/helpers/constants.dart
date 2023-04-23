import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:listanything/app/geocoder/latlong.dart';
import 'package:tuple/tuple.dart';

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

DateTime getCurrentTime() {
  final now = DateTime.now();
  final date = DateTime(now.year, now.month, now.day);
  return date;
}

String formatReadableDate(DateTime d) {
  final diff = d.difference(DateTime.now());
  print(diff);
  if (diff > const Duration(days: 365)) {
    return readableDateFormatterWithYear.format(d);
  } else {
    return readableDateFormatter.format(d);
  }
}

final dateTimeFormatter = DateFormat('yyyy-MM-dd HH:mm');
final dateFormatter = DateFormat('yyyy-MM-dd');
final readableDateFormatter = DateFormat('MMMM d');
final readableDateFormatterWithYear = DateFormat('MMMM d, yyyy');
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
  Iterable<E> sortedBy(Comparable Function(E e) key) => toList()..sort((a, b) => key(a).compareTo(key(b)));
}

AsyncValue<Tuple2<S, T>> combineTwoAsyncValues<S, T>(AsyncValue<S> firstValue, AsyncValue<T> secondValue) {
  return firstValue.when(
    data: (S s) {
      return secondValue.when(
        loading: AsyncValue.loading,
        error: AsyncValue.error,
        data: (T t) => AsyncValue.data(
          Tuple2(
            s,
            t,
          ),
        ),
      );
    },
    loading: AsyncValue.loading,
    error: AsyncValue.error,
  );
}

AsyncValue<Tuple3<S, T, U>> combineThreeAsyncValues<S, T, U>(
  AsyncValue<S> firstValue,
  AsyncValue<T> secondValue,
  AsyncValue<U> thirddValue,
) {
  return combineTwoAsyncValues(firstValue, combineTwoAsyncValues(secondValue, thirddValue)).when(
    error: AsyncValue.error,
    loading: AsyncValue.loading,
    data: (Tuple2<S, Tuple2<T, U>> data) => AsyncValue.data(
      Tuple3(data.item1, data.item2.item1, data.item2.item2),
    ),
  );
}
