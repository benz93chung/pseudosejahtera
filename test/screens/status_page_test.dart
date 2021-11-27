import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/components/base_status_card.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';
import 'package:pseudosejahtera/screens/risk_status_card.dart';
import 'package:pseudosejahtera/screens/vaccination_status_card.dart';

import '../utils/test_utils.dart';

void main() {
  testWidgets('StatusPage is rendered correctly', (tester) async {
    await _pumpCard(tester: tester);

    expect(find.byType(Image), findsOneWidget);
    expect(find.byKey(const ValueKey('username')), findsOneWidget);
    expect(find.byKey(const ValueKey('ic_number')), findsOneWidget);
    expect(find.byType(RiskStatusCard), findsOneWidget);
    expect(find.byType(VaccinationStatusCard), findsOneWidget);
    expect(find.byKey(const ValueKey('check_in_button')), findsOneWidget);
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
