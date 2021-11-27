import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/components/base_status_card.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';

import '../utils/test_utils.dart';

void main() {
  testWidgets('BaseStatusCard is rendered correctly', (tester) async {
    await _pumpCard(tester: tester);

    expect(find.byIcon(Icons.ac_unit), findsOneWidget);
    expect(find.text('Some label'), findsOneWidget);
    expect(find.text('Some text'), findsOneWidget);
  });
}

Future<void> _pumpCard({required WidgetTester tester}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: PseudoScaffold(
      body: Column(
        children: const [
          BaseStatusCard(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            icon: Icons.ac_unit,
            label: 'Some label',
            text: 'Some text',
          ),
        ],
      ),
    ),
  );
}
