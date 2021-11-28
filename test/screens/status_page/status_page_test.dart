import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/screens/status_page/components/bottom_section.dart';
import 'package:pseudosejahtera/screens/status_page/components/check_out_reminder_card.dart';
import 'package:pseudosejahtera/screens/status_page/components/last_check_in_card.dart';
import 'package:pseudosejahtera/screens/status_page/components/name_and_ic_number_section.dart';
import 'package:pseudosejahtera/screens/status_page/components/risk_status_card.dart';
import 'package:pseudosejahtera/screens/status_page/components/vaccination_status_card.dart';
import 'package:pseudosejahtera/screens/status_page/status_page.dart';

import '../../utils/test_utils.dart';
import '../../utils/widget_tester_extensions.dart';

void main() {
  testWidgets('StatusPage is rendered correctly', (tester) async {
    await _pumpPage(tester: tester);

    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(NameAndICNumberSection), findsOneWidget);
    expect(find.byType(RiskStatusCard), findsOneWidget);
    expect(find.byType(VaccinationStatusCard), findsOneWidget);
    expect(find.byType(CheckOutReminderCard), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0.0, -3000.0));
    await tester.pumpNTimes(n: 2);

    expect(find.byType(LastCheckInCard), findsOneWidget);
    expect(find.byType(BottomSection), findsOneWidget);
  });
}

Future<void> _pumpPage({required WidgetTester tester}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: const StatusPage(),
  );
}
