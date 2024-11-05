// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter_test/flutter_test.dart';
// import 'package:listwhatever/custom/pages/listItems/addListItem/add_list_item_page.dart';
import 'package:listwhatever/standard/helpers/date_helper.dart';

void main() {
  test('timeOfDayToSeconds', () {
    expect(DateHelper.timeOfDayToSeconds('0:00'), 0);
    expect(DateHelper.timeOfDayToSeconds('0:01'), 60);
    expect(DateHelper.timeOfDayToSeconds('0:01:01'), 61);
    expect(DateHelper.timeOfDayToSeconds('1:00'), 3600);
    expect(DateHelper.timeOfDayToSeconds('23:59'), 86340);
    expect(DateHelper.timeOfDayToSeconds('23:59:59'), 86399);
  });

  test('secondsToTimeOfDayString', () {
    expect(DateHelper.secondsToTimeOfDayString(0), '00:00');
    expect(DateHelper.secondsToTimeOfDayString(60), '00:01');
    expect(DateHelper.secondsToTimeOfDayString(61), '00:01');
    expect(
      DateHelper.secondsToTimeOfDayString(61, includeSeconds: true),
      '00:01:01',
    );
    expect(DateHelper.secondsToTimeOfDayString(3600), '01:00');
    expect(DateHelper.secondsToTimeOfDayString(86340), '23:59');
    expect(DateHelper.secondsToTimeOfDayString(86399), '23:59');
    expect(
      DateHelper.secondsToTimeOfDayString(86399, includeSeconds: true),
      '23:59:59',
    );
  });
}
