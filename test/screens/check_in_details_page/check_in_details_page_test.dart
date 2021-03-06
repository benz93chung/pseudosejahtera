import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/extensions/date_time_extensions.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/check_in_details_page.dart';

import '../../mocks/cubits/mock_history_page_cubit.dart';
import '../../utils/test_utils.dart';

void main() {
  testWidgets('CheckInDetailsPage shows check-out button if CheckInStatus.checkedIn', (tester) async {
    await _pumpPage(tester: tester, checkInStatus: CheckInStatus.checkedIn);

    expect(find.text('Check-out'), findsOneWidget);
  });

  testWidgets('CheckInDetailsPage shows check-out button if CheckInStatus.checkedOut', (tester) async {
    await _pumpPage(tester: tester, checkInStatus: CheckInStatus.checkedOut);

    expect(find.text('Check-out'), findsNothing);
  });

  testWidgets('Check-out button updates details upon press', (tester) async {
    await _pumpPage(tester: tester, checkInStatus: CheckInStatus.checkedIn);

    final initialDate = DateTime.fromMillisecondsSinceEpoch(1638372448000).getDateOrTimeString(
      dateFormat: ddMMMyyyy,
    );

    final initialTime = DateTime.fromMillisecondsSinceEpoch(1638372448000).getDateOrTimeString(
      dateFormat: hmmssa,
    );

    expect(find.text(initialDate), findsOneWidget);
    expect(find.text(initialTime), findsOneWidget);
    expect(find.text('IN'), findsOneWidget);

    await tester.tap(find.text('Check-out'));
    await tester.pump();

    expect(find.text(initialDate), findsNothing);
    expect(find.text(initialTime), findsNothing);
    expect(find.text('OUT'), findsOneWidget);
  });
}

Future<void> _pumpPage({
  required WidgetTester tester,
  CheckInStatus checkInStatus = CheckInStatus.checkedIn,
}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: CheckInDetailsPage(
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
