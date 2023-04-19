import 'package:flutter_test/flutter_test.dart';
import 'package:listanything/app/helpers/constants.dart';

void main() {
  group('readableDateFormatter', () {
    test('returns a string like "May 5"', () {
      var d = DateTime.parse('2023-12-07');
      expect(formatReadableDate(d), equals('December 7'));

      d = DateTime.parse('2023-12-02');
      expect(formatReadableDate(d), equals('December 2'));

      d = DateTime.parse('2030-12-02');
      expect(formatReadableDate(d), equals('December 2, 2030'));
    });
  });
}
