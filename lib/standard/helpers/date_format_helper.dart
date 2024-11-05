import 'package:intl/intl.dart';

enum DateFormatType { iso8601, us, monthAndDay }

class DateFormatHelper {
  static final dateTimeFormatter = DateFormat('yyyy-MM-dd HH:mm');
  static final dateFormatter = DateFormat('yyyy-MM-dd');
  static final usDateFormatter = DateFormat.yMd();
  static final usDateTimeFormatter = DateFormat.yMd().add_jm();
  static final monthAndDayFormatter = DateFormat('MMMM d');
  static final monthAndDayFormatterWithYear = DateFormat('MMMM d, yyyy');
  static final timeFormatter = DateFormat('HH:mm');
  static final readableDateAndTimeFormatter = DateFormat('d MMM HH:mm');

  static String formatReadableDate(DateTime d, DateFormatType? type) {
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
}
