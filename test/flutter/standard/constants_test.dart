// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter_test/flutter_test.dart';
// import 'package:listwhatever/custom/pages/listItems/addListItem/add_list_item_page.dart';
import 'package:listwhatever/standard/constants.dart';

void main() {
  test('timeOfDayToSeconds', () {
    expect(timeOfDayToSeconds('0:00'), 0);
    expect(timeOfDayToSeconds('0:01'), 60);
    expect(timeOfDayToSeconds('0:01:01'), 61);
    expect(timeOfDayToSeconds('1:00'), 3600);
    expect(timeOfDayToSeconds('23:59'), 86340);
    expect(timeOfDayToSeconds('23:59:59'), 86399);
  });

  test('secondsToTimeOfDayString', () {
    expect(secondsToTimeOfDayString(0), '00:00');
    expect(secondsToTimeOfDayString(60), '00:01');
    expect(secondsToTimeOfDayString(61), '00:01');
    expect(secondsToTimeOfDayString(61, includeSeconds: true), '00:01:01');
    expect(secondsToTimeOfDayString(3600), '01:00');
    expect(secondsToTimeOfDayString(86340), '23:59');
    expect(secondsToTimeOfDayString(86399), '23:59');
    expect(secondsToTimeOfDayString(86399, includeSeconds: true), '23:59:59');
  });
}
