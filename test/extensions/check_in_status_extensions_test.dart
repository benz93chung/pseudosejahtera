import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/extensions/check_in_status_extensions.dart';

void main() {
  test('name returns correctly in accordance to CheckInStatus.checkedIn', () {
    const status = CheckInStatus.checkedIn;
    expect(status.name, 'Check-in');
  });

  test('name returns correctly in accordance to CheckInStatus.checkedOut', () {
    const status = CheckInStatus.checkedOut;
    expect(status.name, 'Check-out');
  });
}
