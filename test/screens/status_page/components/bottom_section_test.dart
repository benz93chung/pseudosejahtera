import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';
import 'package:pseudosejahtera/screens/status_page/components/bottom_section.dart';
import 'package:pseudosejahtera/screens/status_page/components/check_in_button.dart';

import '../../../utils/test_utils.dart';

void main() {
  testWidgets('BottomSection is rendered correctly', (tester) async {
    await _pumpSection(tester: tester);

    expect(find.byType(CheckInButton), findsOneWidget);
  });
}

Future<void> _pumpSection({required WidgetTester tester}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: PseudoScaffold(
      body: Column(
        children: const [BottomSection()],
      ),
    ),
  );
}
