import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/extensions/date_time_extensions.dart';
import 'package:pseudosejahtera/models/check_in.dart';
import 'package:pseudosejahtera/models/check_in_history.dart';
import 'package:pseudosejahtera/screens/status_page/components/last_check_in_card.dart';

import '../../../utils/test_utils.dart';

void main() {
  testWidgets('LastCheckInCard is rendered correctly', (tester) async {
    final checkInHistory = CheckInHistory.create(
      id: 'dont_matter',
      checkIn: CheckIn.create(
        id: 'dont_matter',
        name: 'Sir Alex Ferguson Stand @ Old Trafford',
      ),
      checkInStatus: CheckInStatus.checkedIn,
      createdAt: DateTime.fromMillisecondsSinceEpoch(1638016947000),
      modifiedAt: DateTime.fromMillisecondsSinceEpoch(1638024147000),
    );

    await _pumpCard(
      tester: tester,
      lastCheckInHistory: checkInHistory,
    );

    expect(find.text('History'), findsOneWidget);
    expect(find.text('Last Check-in'), findsOneWidget);
    expect(find.text('Check-out'), findsOneWidget);
    expect(find.text(checkInHistory.checkIn.name), findsOneWidget);
    expect(
      find.text(
        checkInHistory.modifiedAt.getDateOrTimeString(),
      ),
      findsOneWidget,
    );
  });
}

Future<void> _pumpCard({
  required WidgetTester tester,
  required CheckInHistory lastCheckInHistory,
}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: PseudoScaffold(
      body: Column(
        children: [LastCheckInCard(lastCheckInHistory: lastCheckInHistory)],
      ),
    ),
  );
}
