import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';
import 'package:pseudosejahtera/icons/pseudo_sejahtera_icons_icons.dart';
import 'package:pseudosejahtera/screens/vaccination_status_card.dart';

import '../utils/test_utils.dart';

void main() {
  testWidgets('VaccinationStatusCard is rendered correctly', (tester) async {
    await _pumpCard(tester: tester);

    expect(find.byIcon(PseudoSejahteraIcons.vaccines_outlined), findsOneWidget);
    expect(find.text('COVID-19 Vaccination Status'), findsOneWidget);
    expect(find.text('Fully Vaccinated'), findsOneWidget);
  });
}

Future<void> _pumpCard({required WidgetTester tester}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: PseudoScaffold(
      body: Column(
        children: const [VaccinationStatusCard()],
      ),
    ),
  );
}
