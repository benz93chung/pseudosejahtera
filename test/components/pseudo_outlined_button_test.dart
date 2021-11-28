import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/components/pseudo_outlined_button.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';

import '../utils/test_utils.dart';

void main() {
  testWidgets('PseudoOutlinedButton is rendered correctly', (tester) async {
    await _pumpButton(
      tester: tester,
      child: const Text('Waldo'),
      onPressed: () {},
    );

    expect(find.text('Waldo'), findsOneWidget);
  });

  testWidgets('PseudoOutlinedButton onPressed callback works correctly', (tester) async {
    var pressed = false;

    await _pumpButton(
      tester: tester,
      child: const Text('Click me!'),
      onPressed: () {
        pressed = true;
      },
    );

    await tester.tap(find.text('Click me!'));
    expect(pressed, isTrue);
  });
}

Future<void> _pumpButton({
  required WidgetTester tester,
  required Widget child,
  required GestureTapCallback onPressed,
}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: PseudoScaffold(
      body: Center(
        child: PseudoOutlinedButton(
          child: child,
          onPressed: onPressed,
        ),
      ),
    ),
  );
}
