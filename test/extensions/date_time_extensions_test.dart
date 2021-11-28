import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/extensions/date_time_extensions.dart';

void main() {
  group('isToday', () {
    test('isToday returns true if really today', () {
      expect(DateTime.now().isToday(), isTrue);
    });

    test('isToday returns false if it is not today', () {
      expect(DateTime.now().add(const Duration(days: 1)).isToday(), isFalse);
      expect(DateTime.now().subtract(const Duration(days: 100)).isToday(), isFalse);
    });
  });

  group('getDateTimeFullString', () {
    test('getDateTimeFullString is returns expected date time string', () {
      final today = DateTime.now();

      expect(today.getDateOrTimeString(), equals(jm.format(today)));
      expect(DateTime(2021, 3, 9, 8, 56, 23).getDateOrTimeString(), equals('9 Mar 2021, 8:56 AM'));
      expect(DateTime(2021, 6, 15, 18, 56, 23, 1000).getDateOrTimeString(), equals('15 Jun 2021, 6:56 PM'));
    });

    test('getDateTimeFullString is returns expected date time string even with specified DateFormat', () {
      final today = DateTime.now();

      expect(today.getDateOrTimeString(), equals(jm.format(today)));
      expect(DateTime(2021, 3, 9, 8, 56, 23).getDateOrTimeString(dateFormat: ddMMMyyyy), equals('09 Mar 2021'));
      expect(DateTime(2021, 6, 15, 0, 0, 0, 1000).getDateOrTimeString(dateFormat: ddMMMyyyy), equals('15 Jun 2021'));
    });
  });
}
