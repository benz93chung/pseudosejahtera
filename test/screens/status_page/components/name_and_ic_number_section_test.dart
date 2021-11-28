import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';
import 'package:pseudosejahtera/screens/status_page/components/name_and_ic_number_section.dart';

import '../../../utils/test_utils.dart';

void main() {
  testWidgets('NameAndICNumberSection callback works correctly', (tester) async {
    await _pumpCard(
      tester: tester,
      name: 'Matthew Charles Sanders',
      icNumber: '000000000000',
    );

    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Matthew Charles Sanders'.toUpperCase()), findsOneWidget);
    expect(find.text('000000000000'), findsOneWidget);
  });
}

Future<void> _pumpCard({
  required WidgetTester tester,
  required String name,
  required String icNumber,
}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: PseudoScaffold(
      body: Column(
        children: [
          NameAndICNumberSection(
            name: name,
            icNumber: icNumber,
          ),
        ],
      ),
    ),
  );
}
