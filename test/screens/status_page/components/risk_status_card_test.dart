import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';
import 'package:pseudosejahtera/screens/status_page/components/risk_status_card.dart';

import '../../../utils/test_utils.dart';

void main() {
  testWidgets('RiskStatusCard is rendered correctly', (tester) async {
    await _pumpCard(tester: tester);

    expect(find.byIcon(Icons.coronavirus_outlined), findsOneWidget);
    expect(find.text('COVID-19 Risk Status'), findsOneWidget);
    expect(find.text('Low Risk No Symptom'), findsOneWidget);
  });
}

Future<void> _pumpCard({required WidgetTester tester}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: PseudoScaffold(
      body: Column(
        children: const [RiskStatusCard()],
      ),
    ),
  );
}
