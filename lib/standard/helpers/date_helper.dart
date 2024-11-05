class DateHelper {
  static final DateTime minDateTime = DateTime.utc(1900, 04, 20);
  static final DateTime maxDateTime = DateTime.utc(2100, 09, 13);

  static DateTime getCurrentDate() {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day);
    return date;
  }

  static String doubleDigit(int num) {
    if (num < 10) {
      return '0$num';
    }
    return '$num';
  }

  static int timeOfDayToSeconds(String t) {
    final spl = t.split(':');
    final h = int.parse(spl[0]);
    final m = int.parse(spl[1]);
    final s = (spl.length > 2) ? int.parse(spl[2]) : 0;
    final v = h * 3600 + m * 60 + s;
    return v;
  }

  static String secondsToTimeOfDayString(int t, {bool includeSeconds = false}) {
    final h = t ~/ 3600;
    final m = (t - h * 3600) ~/ 60;
    if (includeSeconds) {
      final s = t - h * 3600 - m * 60;
      return '${doubleDigit(h)}:${doubleDigit(m)}:${doubleDigit(s)}';
    }
    return '${doubleDigit(h)}:${doubleDigit(m)}';
  }
}
