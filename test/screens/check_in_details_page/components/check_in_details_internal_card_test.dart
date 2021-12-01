import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/components/check_in_details_field.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/components/check_in_details_internal_card.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/components/check_in_risk_status_card.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/components/check_in_vaccination_status_card.dart';

import '../../../mocks/cubits/mock_history_page_cubit.dart';
import '../../../utils/test_utils.dart';

void main() {
  group('General assertion', () {
    testWidgets('CheckInDetailsInternalCard is rendered with expected elements', (tester) async {
      await _pumpCard(
        tester: tester,
        checkInStatus: CheckInStatus.checkedIn,
      );

      // Top section
      expect(find.byType(Image), findsOneWidget);
      expect(find.text('Thank you'), findsOneWidget);
      expect(find.text('You\'ve successfully registered!'), findsOneWidget);

      // Fields
      expect(find.text('Check-in Information'), findsOneWidget);
      expect(find.byType(CheckInDetailsField), findsNWidgets(5));
      expect(find.text('Location'), findsOneWidget);
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Telephone Number'), findsOneWidget);
      expect(find.text('Date'), findsOneWidget);
      expect(find.text('Time'), findsOneWidget);

      // Status cards
      expect(find.byType(CheckInRiskStatusCard), findsOneWidget);
      expect(find.byType(CheckInVaccinationStatusCard), findsOneWidget);

      expect(find.text('Please present this ticket to the personnel of the premise upon request'), findsOneWidget);
    });
  });
}

Future<void> _pumpCard({
  required WidgetTester tester,
  CheckInStatus checkInStatus = CheckInStatus.checkedIn,
}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: CheckInDetailsInternalCard(
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
