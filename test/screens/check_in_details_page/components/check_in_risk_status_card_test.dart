import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/components/check_in_risk_status_card.dart';

import '../../../utils/test_utils.dart';

void main() {
  testWidgets('CheckInRiskStatusCard is rendered with expected elements', (tester) async {
    await _pumpCard(tester: tester);

    expect(find.text('Risk Status'), findsOneWidget);
    expect(find.text('Low'), findsOneWidget);
  });
}

Future<void> _pumpCard({required WidgetTester tester}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: const Center(
      child: CheckInRiskStatusCard(),
    ),
  );
}
