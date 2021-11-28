import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/components/base_card.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';

import '../utils/test_utils.dart';

void main() {
  testWidgets('BaseCard is rendered correctly', (tester) async {
    await _pumpCard(tester: tester);
    expect(find.text('Waldo'), findsOneWidget);
  });
}

Future<void> _pumpCard({required WidgetTester tester}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: const PseudoScaffold(
      body: BaseCard(child: Text('Waldo')),
    ),
  );
}
