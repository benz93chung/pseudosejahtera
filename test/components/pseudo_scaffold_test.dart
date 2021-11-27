import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';

import '../utils/test_utils.dart';

void main() {
  testWidgets('PseudoScaffold renders correctly', (tester) async {
    await pumpWidgetToTest(
      tester: tester,
      widgetToTest: PseudoScaffold(
        body: Column(
          children: const [
            Text('Hi'),
            Text('I am'),
            Text('Here!'),
          ],
        ),
      ),
    );

    expect(find.text('Hi'), findsOneWidget);
    expect(find.text('I am'), findsOneWidget);
    expect(find.text('Here!'), findsOneWidget);
  });
}
