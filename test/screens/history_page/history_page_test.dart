import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/screens/history_page/history_page.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets('HistoryPage is rendered correctly', (tester) async {
    await _pumpPage(tester: tester);

    expect(find.byType(Tab), findsNWidgets(2));
    expect(find.text('Checked-in'), findsOneWidget);
    expect(find.text('Checked-out'), findsOneWidget);
  });
}

Future<void> _pumpPage({required WidgetTester tester}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: const HistoryPage(),
  );
}
