import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/extensions/check_in_status_extensions.dart';
import 'package:tuple/tuple.dart';

void main() {
  group('name', () {
    test('name returns correctly in accordance to CheckInStatus.checkedIn', () {
      const status = CheckInStatus.checkedIn;
      expect(status.name, equals('Check-in'));
    });

    test('name returns correctly in accordance to CheckInStatus.checkedOut', () {
      const status = CheckInStatus.checkedOut;
      expect(status.name, equals('Check-out'));
    });
  });

  group('arrow', () {
    test('arrow returns correctly in accordance to CheckInStatus.checkedIn', () {
      const status = CheckInStatus.checkedIn;

      expect(
        status.arrow,
        equals(const Tuple2('IN', Icons.arrow_forward_sharp)),
      );
    });

    test('arrow returns correctly in accordance to CheckInStatus.checkedOut', () {
      const status = CheckInStatus.checkedOut;

      expect(
        status.arrow,
        equals(const Tuple2('OUT', Icons.arrow_back_sharp)),
      );
    });
  });
}
