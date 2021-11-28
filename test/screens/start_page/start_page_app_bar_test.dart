import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/components/pseudo_button.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';
import 'package:pseudosejahtera/screens/start_page/start_page_app_bar.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets('StartPageAppBar is rendered correctly', (tester) async {
    await _pumpAppBarWithScaffold(tester: tester);

    expect(find.byIcon(Icons.refresh), findsOneWidget);
    expect(find.text('Refresh Status'), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(PseudoButton),
        matching: find.text('Close'),
      ),
      findsOneWidget,
    );
  });
}

Future<void> _pumpAppBarWithScaffold({
  required WidgetTester tester,
}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: const PseudoScaffold(
      appBar: StartPageAppBar(),
      body: Center(
        child: Text('Testing 1 2'),
      ),
    ),
  );
}
