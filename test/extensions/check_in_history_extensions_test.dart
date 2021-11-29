import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/extensions/check_in_history_extensions.dart';
import 'package:pseudosejahtera/models/check_in_history.dart';

import '../mocks/cubits/mock_history_page_cubit.dart';

void main() {
  test(
    'description returns correctly in accordance to CheckInStatus.checkedIn from history',
    () {
      final history = _getHistory(checkInStatus: CheckInStatus.checkedIn);
      expect(history.description, 'Check-in at MORBITES Burger (formerly SixtyBites)');
    },
  );

  test(
    'description returns correctly in accordance to CheckInStatus.checkedOut from history',
    () {
      final history = _getHistory(checkInStatus: CheckInStatus.checkedOut);
      expect(history.description, 'Check-out at MORBITES Burger (formerly SixtyBites)');
    },
  );
}

CheckInHistory _getHistory({
  required CheckInStatus checkInStatus,
}) =>
    buildCheckInHistoryFromTemplate(
      id: '6d314ed3-6ff0-49f7-bd93-963e10fd8bc4',
      checkIn: buildCheckInFromTemplate(
        id: 'ae564ca1-e7ef-4850-bf07-365f10598026',
        name: 'MORBITES Burger (formerly SixtyBites)',
      ),
      checkInStatus: checkInStatus,
      createdAt: DateTime.fromMillisecondsSinceEpoch(1638016947000),
      modifiedAt: DateTime.fromMillisecondsSinceEpoch(1638024147000),
    );
