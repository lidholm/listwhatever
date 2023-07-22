import 'package:flutter_test/flutter_test.dart';
import 'package:listanything/app/custom/pages/settings/settings.dart';
import 'package:listanything/app/standard/helpers/constants.dart';

void main() {
  group('readableDateFormatter', () {
    test('returns a string like "May 5"', () {
      var d = DateTime.parse('2023-12-07');
      final formatted1 = formatReadableDate(d, DateFormatType.MONTH_AND_DAY);
      expect(formatted1, equals('December 7'));

      d = DateTime.parse('2023-12-02');
      final formatted2 = formatReadableDate(d, DateFormatType.MONTH_AND_DAY);
      expect(formatted2, equals('December 2'));

      d = DateTime.parse('2030-12-02');
      final formatted3 = formatReadableDate(d, DateFormatType.MONTH_AND_DAY);
      expect(formatted3, equals('December 2, 2030'));
    });

    test('returns a string like "2001-09-13"', () {
      var d = DateTime.parse('2023-12-07');
      expect(
        formatReadableDate(d, DateFormatType.ISO_8601),
        equals('2023-12-07'),
      );

      d = DateTime.parse('2023-12-02');
      expect(
        formatReadableDate(d, DateFormatType.ISO_8601),
        equals('2023-12-02'),
      );

      d = DateTime.parse('2030-12-02');
      expect(
        formatReadableDate(d, DateFormatType.ISO_8601),
        equals('2030-12-02'),
      );
    });

    test('returns a string like "13/9/2001"', () {
      var d = DateTime.parse('2023-12-07');
      final formatted1 = formatReadableDate(d, DateFormatType.US);
      expect(formatted1, equals('12/7/2023'));

      d = DateTime.parse('2023-12-02');
      final formatted2 = formatReadableDate(d, DateFormatType.US);
      expect(formatted2, equals('12/2/2023'));

      d = DateTime.parse('2030-12-02');
      final formatted3 = formatReadableDate(d, DateFormatType.US);
      expect(formatted3, equals('12/2/2030'));
    });
  });
}
