import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/components/pseudo_outlined_button.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';
import 'package:pseudosejahtera/screens/status_page/components/check_out_reminder_card.dart';

import '../../../utils/test_utils.dart';

void main() {
  testWidgets('CheckOutReminderCard callback works correctly', (tester) async {
    await _pumpCard(
      tester: tester,
      historyCount: 13,
    );

    expect(find.text('You are currently checked-in at 13 locations.'), findsOneWidget);
    expect(
      find.text('Please check-out from locations you are no longer present at.'),
      findsOneWidget,
    );
    expect(
      find.descendant(of: find.byType(PseudoOutlinedButton), matching: find.text('Review Check-in History')),
      findsOneWidget,
    );
  });
}

Future<void> _pumpCard({
  required WidgetTester tester,
  required int historyCount,
}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: PseudoScaffold(
      body: Column(
        children: [CheckOutReminderCard(historyCount: historyCount)],
      ),
    ),
  );
}
