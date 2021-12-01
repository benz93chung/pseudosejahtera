import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/components/check_in_details_card.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/components/check_in_details_internal_card.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/components/check_in_status_signage.dart';

import '../../../mocks/cubits/mock_history_page_cubit.dart';
import '../../../utils/test_utils.dart';

void main() {
  group('General assertion', () {
    testWidgets('CheckInDetailsCard is rendered correctly', (tester) async {
      await _pumpCard(tester: tester);

      expect(find.byType(CheckInDetailsInternalCard), findsOneWidget);
      expect(find.byType(CheckInStatusSignage), findsOneWidget);
    });
  });

  group('CheckInDetailsCard', () {
    testWidgets('CheckInDetailsCard is rendered correctly if CheckInStatus.checkedIn', (tester) async {
      await _pumpCard(
        tester: tester,
        checkInStatus: CheckInStatus.checkedIn,
      );

      expect(find.text('IN'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward_sharp), findsOneWidget);
    });

    testWidgets('CheckInDetailsCard is rendered correctly if CheckInStatus.checkedOut', (tester) async {
      await _pumpCard(
        tester: tester,
        checkInStatus: CheckInStatus.checkedOut,
      );

      expect(find.text('OUT'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back_sharp), findsOneWidget);
    });
  });
}

Future<void> _pumpCard({
  required WidgetTester tester,
  CheckInStatus checkInStatus = CheckInStatus.checkedIn,
}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: CheckInDetailsCard(
      checkInHistory: buildCheckInHistoryFromTemplate(
        id: 'dont_matter',
        checkIn: buildCheckInFromTemplate(id: 'dont_matter', name: 'Test Check-in Location'),
        checkInStatus: checkInStatus,
        createdAt: DateTime.fromMillisecondsSinceEpoch(1638372448000),
        modifiedAt: DateTime.fromMillisecondsSinceEpoch(1638372448000),
      ),
    ),
  );
}
