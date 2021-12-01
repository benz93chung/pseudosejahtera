import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/components/check_in_status_signage.dart';

import '../../../utils/test_utils.dart';

void main() {
  testWidgets(
    'CheckInStatusSignage is rendered with expected elements if CheckInStatusSignage.checkedIn',
    (tester) async {
      await _pumpCard(tester: tester, checkInStatus: CheckInStatus.checkedIn);

      expect(find.text('IN'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward_sharp), findsOneWidget);
    },
  );

  testWidgets(
    'CheckInStatusSignage is rendered with expected elements if CheckInStatusSignage.checkedOut',
    (tester) async {
      await _pumpCard(tester: tester, checkInStatus: CheckInStatus.checkedOut);

      expect(find.text('OUT'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back_sharp), findsOneWidget);
    },
  );
}

Future<void> _pumpCard({
  required WidgetTester tester,
  required CheckInStatus checkInStatus,
}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: Center(
      child: CheckInStatusSignage(checkInStatus: checkInStatus),
    ),
  );
}
