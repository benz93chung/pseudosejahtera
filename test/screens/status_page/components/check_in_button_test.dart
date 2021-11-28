import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';
import 'package:pseudosejahtera/screens/status_page/components/check_in_button.dart';

import '../../../utils/test_utils.dart';

void main() {
  testWidgets('CheckInButton is rendered correctly', (tester) async {
    await _pumpButton(tester: tester);

    expect(find.text('Check-in'), findsOneWidget);
  });

  testWidgets('CheckInButton callback works correctly', (tester) async {
    var pressed = false;

    await _pumpButton(
      tester: tester,
      onPressed: () {
        pressed = true;
      },
    );

    await tester.tap(find.text('Check-in'));
    expect(pressed, isTrue);
  });
}

Future<void> _pumpButton({
  required WidgetTester tester,
  GestureTapCallback? onPressed,
}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: PseudoScaffold(
      body: Column(
        children: [
          CheckInButton(
            onPressed: onPressed ?? () {},
          ),
        ],
      ),
    ),
  );
}
